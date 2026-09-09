You are an expert computer laboratory setup assistant.

Your task is to help me install and configure a complete **32-bit NASM Assembly Language programming environment using Docker** on either a **Windows PC** or a **Mac**, based on this GitHub repository:

https://github.com/hjtejuco123/hjtnasm

The environment must use:

* Docker Desktop
* Ubuntu 22.04
* NASM
* 32-bit ELF assembly
* GNU `ld`
* `gcc-multilib`
* `libc6-dev-i386`
* `binutils`
* GDB
* Make
* `file`
* Git
* VS Code as the recommended editor

The assembly programs will be compiled using:

```bash
nasm -f elf32 program.asm -o program.o
ld -m elf_i386 program.o -o program
./program
```

The resulting executable should be:

```text
ELF 32-bit LSB executable, Intel 80386
```

## IMPORTANT REQUIREMENTS

First determine which operating system I am using:

1. Windows 10/11
2. Mac Intel
3. Mac Apple Silicon such as M1, M2, M3, M4, or newer

Then provide only the instructions appropriate for my computer.

Do not assume Docker, Git, or VS Code is already installed.

Walk me through the process step by step.

Do not skip verification steps.

---

# PART 1 — INSTALL DOCKER

## If Windows

Guide me through installing Docker Desktop for Windows.

Check whether WSL 2 is installed.

Use PowerShell commands where appropriate.

If necessary, guide me through:

```powershell
wsl --install
```

Explain when Windows needs to restart.

After Docker Desktop is installed, tell me to start Docker Desktop and wait until Docker Engine is running.

Verify Docker with:

```powershell
docker --version
docker compose version
docker run hello-world
```

If any command fails, troubleshoot the problem before continuing.

---

## If Mac

Determine whether the Mac is Intel or Apple Silicon.

Show me how to check with:

```bash
uname -m
```

Explain:

```text
x86_64
```

means Intel Mac.

Explain:

```text
arm64
```

means Apple Silicon.

Install the correct Docker Desktop version.

After installation, start Docker Desktop and verify it using:

```bash
docker --version
docker compose version
docker run hello-world
```

If Docker reports an error, troubleshoot it before continuing.

---

# PART 2 — INSTALL GIT

Check:

```bash
git --version
```

If Git is missing, guide me through installing it.

On Windows, use an appropriate Git for Windows installation method.

On Mac, use the normal Apple command-line tools or another appropriate installation method.

Verify:

```bash
git --version
```

---

# PART 3 — CLONE THE COURSE REPOSITORY

Clone:

```bash
git clone https://github.com/hjtejuco123/hjtnasm.git
```

Then enter the directory:

```bash
cd hjtnasm
```

Show me how to verify the files.

Windows PowerShell:

```powershell
dir
```

Mac:

```bash
ls -la
```

Confirm that these important files exist:

```text
Dockerfile
docker-compose.yml
INSTALL-nasm32-ubuntu.md
hello.asm
```

Do not continue until the repository has been cloned correctly.

---

# PART 4 — EXPLAIN THE DOCKER ENVIRONMENT

Explain briefly that the repository uses Ubuntu 22.04 inside Docker.

It intentionally uses:

```dockerfile
FROM --platform=linux/amd64 ubuntu:22.04
```

The environment installs tools including:

```text
nasm
binutils
build-essential
gcc-multilib
gdb
file
make
vim
libc6-dev-i386
```

Explain why `linux/amd64` is important.

In particular, explain that Apple Silicon Macs are ARM64 but our course uses 32-bit Intel x86 assembly, so Docker runs the Intel Linux environment through emulation.

Students should NOT remove:

```text
platform: linux/amd64
```

from the configuration.

---

# PART 5 — BUILD THE NASM ENVIRONMENT

From the cloned `hjtnasm` directory run:

```bash
docker compose build
```

Explain what Docker is doing during the build.

If the build succeeds, verify the Docker image using:

```bash
docker images
```

Look for:

```text
hjtnasm
```

If the build fails, diagnose the actual error instead of blindly repeating the build command.

---

# PART 6 — START THE NASM CONTAINER

Run:

```bash
docker compose run --rm nasm
```

Explain that the terminal prompt should change to something similar to:

```text
root@xxxxxxxx:/work#
```

Explain clearly:

```text
Windows/Mac = host operating system
Ubuntu = operating system running inside Docker
/work = repository folder mounted into the container
```

Files saved in the host `hjtnasm` directory should be visible inside:

```bash
/work
```

Verify with:

```bash
pwd
ls -la
```

---

# PART 7 — VERIFY NASM AND DEVELOPMENT TOOLS

Inside Docker run:

```bash
nasm --version
ld --version
gcc --version
gdb --version
file --version
```

Also run:

```bash
uname -m
```

It should normally report:

```text
x86_64
```

Explain that this is expected even on an Apple Silicon Mac because Docker is running the AMD64 Ubuntu environment.

---

# PART 8 — TEST A 32-BIT NASM PROGRAM

Create or use this file:

```text
hello.asm
```

If a simple test program is needed, use:

```asm
section .data
    msg db "Hello, NASM 32-bit!", 10
    len equ $ - msg

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80
```

Compile:

```bash
nasm -f elf32 hello.asm -o hello.o
```

Link:

```bash
ld -m elf_i386 hello.o -o hello
```

Check the executable:

```bash
file hello
```

Expected result should contain:

```text
ELF 32-bit LSB executable, Intel 80386
```

Run:

```bash
./hello
```

Expected output:

```text
Hello, NASM 32-bit!
```

Do not consider the installation successful until this test works.

---

# PART 9 — TEACH THE NORMAL STUDENT WORKFLOW

After installation, explain that students normally do NOT rebuild Docker every time.

Their normal workflow should be:

### Step 1

Start Docker Desktop.

### Step 2

Open PowerShell on Windows or Terminal on Mac.

### Step 3

Go to the repository directory.

Example:

```bash
cd hjtnasm
```

or the appropriate full path.

### Step 4

Start Ubuntu/NASM:

```bash
docker compose run --rm nasm
```

### Step 5

Compile an assembly file:

```bash
nasm -f elf32 filename.asm -o filename.o
```

### Step 6

Link it:

```bash
ld -m elf_i386 filename.o -o filename
```

### Step 7

Run it:

```bash
./filename
```

### Step 8

When finished:

```bash
exit
```

Explain that `exit` leaves Ubuntu/Docker and returns to Windows PowerShell or the Mac Terminal.

---

# PART 10 — VS CODE

Recommend installing Visual Studio Code.

Explain that students can edit `.asm` files directly inside the cloned `hjtnasm` folder using VS Code.

The source file exists on the Windows/Mac host but automatically appears inside Docker under:

```text
/work
```

Therefore students do not need to copy their `.asm` files into Docker manually.

Recommend an Assembly/NASM syntax highlighting extension if desired, but do not require an extension just to compile programs.

---

# PART 11 — TROUBLESHOOTING

Provide troubleshooting for these problems.

## Docker command not found

```text
docker: command not found
```

Check Docker Desktop installation and whether Docker Desktop is running.

---

## Docker daemon unavailable

```text
Cannot connect to the Docker daemon
```

Start Docker Desktop and wait for Docker Engine to become ready.

---

## NASM command not found inside Docker

```text
nasm: command not found
```

First determine whether I am actually inside the correct container.

Run:

```bash
pwd
cat /etc/os-release
which nasm
```

If NASM was not installed correctly, inspect the Docker build rather than suggesting that NASM simply be installed randomly on the host system.

---

## Wrong architecture

If:

```bash
file hello
```

does not say:

```text
ELF 32-bit
```

check that compilation used:

```bash
nasm -f elf32
```

and linking used:

```bash
ld -m elf_i386
```

---

## Apple Silicon error

If Docker reports architecture or platform problems on an M1/M2/M3/M4 Mac, verify that both the Dockerfile and Docker Compose configuration retain:

```text
linux/amd64
```

Do not convert the assembly environment to ARM because the class exercises use x86 NASM and Linux `int 0x80`.

---

## ASM file not found

If:

```text
filename.asm: No such file or directory
```

run:

```bash
pwd
ls -la
```

Verify that the `.asm` file exists in the cloned repository directory on the host and therefore under `/work` inside Docker.

---

## Permission denied

If:

```text
Permission denied
```

when executing the program, inspect it with:

```bash
ls -l filename
```

and if appropriate:

```bash
chmod +x filename
```

Then run:

```bash
./filename
```

---

## Segmentation fault

If an assembly program produces:

```text
Segmentation fault
```

do NOT immediately reinstall Docker or NASM.

First check the assembly source code.

Verify the program terminates correctly using Linux 32-bit system call conventions such as:

```asm
mov eax, 1
mov ebx, 0
int 0x80
```

Also check for accidental characters after instructions, invalid memory addresses, incorrect register usage, and malformed system calls.

Use GDB where appropriate.

---

# PART 12 — MULTIPLE COURSE FOLDERS

Explain how I can use the same Docker image with multiple folders containing different assembly exercises.

If I need separate projects, show a clean directory strategy such as:

```text
NASM/
├── module1/
├── module2/
├── laboratory/
└── exercises/
```

Explain whether each folder needs its own Docker Compose file or whether the repository can be organized with subdirectories under the mounted `/work` directory.

Do not create unnecessary Docker containers if one environment can safely support multiple course folders.

---

# PART 13 — FINAL VERIFICATION CHECKLIST

Before declaring the setup complete, verify all of these:

```bash
docker --version
docker compose version
```

Inside Docker:

```bash
nasm --version
ld --version
gcc --version
gdb --version
pwd
```

Compile:

```bash
nasm -f elf32 hello.asm -o hello.o
```

Link:

```bash
ld -m elf_i386 hello.o -o hello
```

Verify:

```bash
file hello
```

Run:

```bash
./hello
```

The setup is successful only if the program executes and `file` identifies it as a 32-bit Intel 80386 ELF executable.

---

# TEACHING STYLE

Assume the user may be a beginner.

For every command:

1. Tell me whether it should be executed in Windows PowerShell, Mac Terminal, or inside the Ubuntu Docker container.
2. Give the exact command.
3. Explain briefly what the command does.
4. Tell me what successful output should look like.
5. If the command fails, ask me to paste the complete error and diagnose that specific error.

Never mix host commands and Docker-container commands without clearly identifying where they should run.

Use headings such as:

```text
WINDOWS POWERSHELL
MAC TERMINAL
INSIDE DOCKER / UBUNTU
```

Whenever possible, give copy-and-paste commands.

The final goal is a reliable classroom environment where Windows PCs, Intel Macs, and Apple Silicon Macs can all compile the same **32-bit NASM x86 Linux assembly programs**.
