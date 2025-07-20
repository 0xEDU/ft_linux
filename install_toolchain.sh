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
	echo "Sources directory already created!"
fi

# Downloads packages to $LFS/sources if not downloaded yet

if [ -z "$(ls -A $LFS/sources)" ]; then
	echo "Downloading packages..."
	wget --input-file=$WGET_LIST --continue --directory-prefix=$LFS/sources
else
	echo "Packages already downloaded!"
fi

