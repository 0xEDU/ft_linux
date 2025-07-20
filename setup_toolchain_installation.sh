#!/bin/bash
# Written by etachott

# Global variables

LFS=/mnt/lfs
WGET_LIST=./wget_list

# Create source directory if not exists

if [[ ! -d $LFS/sources ]]; then
	echo "Creating sources directory..."
	mkdir -v $LFS/sources
	chmod -v a+wt $LFS/sources
else
	echo "/sources directory already created!"
fi

# Downloads packages to $LFS/sources if not downloaded yet

if [ -z "$(ls -A $LFS/sources)" ]; then
	echo "Downloading packages..."
	wget --input-file=$WGET_LIST --continue --directory-prefix=$LFS/sources
else
	echo "Packages already downloaded!"
fi

# Create tools directory if not exists

if [[ ! -d $LFS/tools ]]; then
	echo "Creating tools directory..."
	mkdir -v $LFS/tools
	ln -sv $LFS/tools /
else
	echo "/tools directory already created!"
fi

# Create lfs user if not exists

if ! id -u lfs &> /dev/null; then
	echo "Creating user 'lfs'..."
	groupadd lfs
	useradd -s /bin/bash -g lfs -m -k /dev/null lfs
	chown -v lfs $LFS/tools
	chown -v lfs $LFS/sources
else
	echo "User 'lfs' already exists!"
fi
