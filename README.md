# ft linux

My very own linux distro!

---

## Usage

The build is divided into several steps, following roughly [Linux From Scratch 7.9](https://www.linuxfromscratch.org/museum/lfs-museum/7.9/LFS-BOOK-7.9-HTML/). Make sure you meet all system requirements before starting to compile.

1. Partition your disk, 20GB should be more than enough. My scripts assume that the mounted dir will be `/mnt/lfs`. All commands should be executed as root.
2. Inside the mounted dir, clone this repo.
3. Run `bash setup_toolchain_installation.sh`, it will create the needed folders and a new user `lfs`.
4. Run `su - lfs $PWD/install_toolchain.sh`, it will build and install the temporary toolchain.
