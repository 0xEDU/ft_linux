#!/bin/bash
# Written by etachott
LFS=/mnt/lfs

echo "Changing ownership to root..."
chown -R root:root $LFS/tools
echo "Done!"

echo "Preparing Virtual Kernel File Systems..."

# Mount and populate /dev
mkdir -pv $LFS/{dev,proc,sys,run}

# Create initial device nodes
mknod -m 600 $LFS/dev/console c 5 1
mknod -m 666 $LFS/dev/null c 1 3
mount -v --bind /dev $LFS/dev

# Mount Virtual Kernel File Systems
mount -vt devpts devpts $LFS/dev/pts -o gid=5,mode=620
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run
if [ -h $LFS/dev/shm ]; then
	mkdir -pv $LFS/$(readlink $LFS/dev/shm)
fi

