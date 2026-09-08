# Installing NASM (32-bit) on Ubuntu — Student Guide

This guide sets up a **32-bit NASM assembly** environment using an **Ubuntu 22.04** container in Docker.
It works the same on **Windows** and **Mac**, so everyone in class has an identical setup.

You will be able to:

```
nasm -f elf32 hw.asm -o hw.o
ld   -m elf_i386 hw.o -o hw
./hw
```

---

## Part 0 — What you need

| Thing | Why |
|-------|-----|
| Docker Desktop | Runs the Ubuntu environment |
| A folder for your code | Where you keep your `.asm` files |
| A text editor (VS Code recommended) | Writing assembly |

> **Mac (Apple Silicon / M1–M4):** the 32-bit tools only exist for Intel Ubuntu,
> so we force the image to `linux/amd64`. Docker runs it through emulation — it is
> slower but works fine for class exercises. Every command below already includes
> the right flag.

---

## Part 1 — Install Docker Desktop

### Windows

1. Download Docker Desktop: <https://www.docker.com/products/docker-desktop/>
2. Run the installer. Keep **"Use WSL 2"** checked.
3. Restart the computer when asked.
4. Open **Docker Desktop** and wait until it says **"Engine running"** (bottom-left).

### Mac

1. Download Docker Desktop (pick **Apple Silicon** or **Intel** to match your Mac).
2. Drag Docker to **Applications**, then open it.
3. Wait until the whale icon in the menu bar stops animating.

### Check it works

Open a terminal (Windows: **PowerShell**; Mac: **Terminal**) and run:

```
docker run hello-world
```

You should see **"Hello from Docker!"**. If you do, Docker is ready.

---

## Part 2 — Make a folder for your code

Pick somewhere easy to find. Example:

**Windows (PowerShell):**
```
mkdir $HOME\Desktop\asm
cd $HOME\Desktop\asm
```

**Mac (Terminal):**
```
mkdir ~/Desktop/asm
cd ~/Desktop/asm
```

Everything you put in this folder will appear inside the container at `/work`,
and anything you create in `/work` shows up in this folder. Nothing is lost when
the container closes.

---

## Part 3 — Create the Docker setup files

Inside your `asm` folder, create these **two** files exactly as shown.

### File 1: `Dockerfile` (no extension)

```dockerfile
FROM --platform=linux/amd64 ubuntu:22.04

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        nasm \
        binutils \
        build-essential \
        gcc-multilib \
        gdb \
        file \
        make \
        vim \
        libc6-dev-i386 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /work
CMD ["bash"]
```

### File 2: `docker-compose.yml`

```yaml
services:
  nasm:
    build: .
    platform: linux/amd64
    image: hjtnasm
    container_name: hjtnasm
    working_dir: /work
    volumes:
      - .:/work
    stdin_open: true
    tty: true
```

---

## Part 4 — Build the environment (one time)

From inside your `asm` folder:

```
docker compose build
```

The first run downloads Ubuntu and the assembler — this takes a few minutes.
When it finishes you will see something like `naming to docker.io/library/hjtnasm`.

You only do this **once** (or again if you change the `Dockerfile`).

---

## Part 5 — Enter the environment

```
docker compose run --rm nasm
```

Your prompt changes to something like:

```
root@a1b2c3d4:/work#
```

You are now **inside Ubuntu**. Type `exit` to leave and return to your normal terminal.

### Verify the tools

```
nasm --version
ld --version
```

You should see `NASM version 2.15.05` and `GNU ld ... 2.38`.

---

## Part 6 — Write and run your first program

Leave the container for a moment (or use your editor) and create `hw.asm` in the
`asm` folder:

```asm
section .data
    msg db "Hello, NASM 32-bit!", 10
    len equ $ - msg

section .text
    global _start

_start:
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, msg
    mov edx, len
    int 0x80

    mov eax, 1          ; sys_exit
    mov ebx, 0
    int 0x80
```

Back **inside the container** (`docker compose run --rm nasm`), compile and run:

```
nasm -f elf32 hw.asm -o hw.o
ld   -m elf_i386 hw.o -o hw
./hw
```

Expected output:

```
Hello, NASM 32-bit!
```

Check it is really 32-bit:

```
file hw
```

Should say: `ELF 32-bit LSB executable, Intel 80386`.

---

## Everyday workflow (after setup)

1. Open Docker Desktop (wait for "Engine running").
2. In a terminal: `cd` to your `asm` folder.
3. `docker compose run --rm nasm`
4. Edit `.asm` files in VS Code, compile/run inside the container.
5. `exit` when done.

---

## Troubleshooting

| Problem | Fix |
|--------|-----|
| `docker: command not found` | Docker Desktop is not installed or not started. Open it and wait for "Engine running". |
| `Cannot connect to the Docker daemon` | Docker Desktop is not running. Start it. |
| Build fails on `gcc-multilib` / `libc6-dev-i386` | You removed `--platform=linux/amd64`. Put it back in both files. |
| `hw.asm: No such file or directory` inside container | The file is not in the folder you ran the command from. Run `ls` inside the container to check. |
| Permission denied on `./hw` | Run `chmod +x hw` then `./hw`. |
| Everything is very slow (Apple Silicon) | Expected — it's emulating Intel. Fine for coursework. |
| Want a fresh start | `docker compose down` then `docker compose build --no-cache`. |

---

## Alternative: real Ubuntu (VirtualBox / WSL / native)

If you are already on **Ubuntu 22.04** (a PC, a VirtualBox VM, or WSL), skip Docker
entirely and install directly:

```
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y nasm binutils build-essential gcc-multilib libc6-dev-i386
```

Then the same compile commands work:

```
nasm -f elf32 hw.asm -o hw.o
ld   -m elf_i386 hw.o -o hw
./hw
```
