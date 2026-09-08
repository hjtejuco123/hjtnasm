#!/usr/bin/env bash
# Build (if needed) and enter the NASM 32-bit container with this folder mounted at /work.
set -e
cd "$(dirname "$0")"

docker build --platform=linux/amd64 -t hjtnasm .
docker run --platform=linux/amd64 --rm -it -v "$PWD":/work -w /work hjtnasm bash
