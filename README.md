# hjtnasm

32-bit NASM assembly dev environment in Docker.

## Usage

```
./nasm.sh            # build image + open a shell with this folder at /work
```

or with compose:

```
docker compose run --rm nasm
```

Inside the container:

```
nasm -f elf32 hw.asm -o hw.o
ld -m elf_i386 hw.o -o hw
./hw
```

Note: image is `linux/amd64` (runs via emulation on Apple Silicon) so the
32-bit `i386` toolchain packages are available.
