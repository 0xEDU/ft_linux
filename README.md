# ft linux

My very own linux distro!

---

## Usage

The build is divided into several steps, following roughly [Linux From Scratch 7.9](https://www.linuxfromscratch.org/museum/lfs-museum/7.9/LFS-BOOK-7.9-HTML/). Make sure you meet all system requirements before starting to compile, there are some scripts at `utils/` to help with that.

1. Partition your disk, 20GB should be more than enough. My scripts assume that the mounted dir will be `/mnt/lfs`. All commands should be executed as root.
2. Inside the mounted dir, clone this repo.
3. Run `bash setup_toolchain_installation.sh` to create the needed folders and a new user `lfs`.
4. Run `su - lfs $PWD/install_toolchain.sh` to build and install the temporary toolchain. Should take a while.
5. Run `bash post_toolchain_installation.sh` to mount the needed Virtual Kernel File Systems.
6. Run `bash setup_system_installation.sh` to prepare the new system for package installation.
7. Run `bash install_system_packages.sh` to install the packages in the new system.
