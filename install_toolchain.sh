#!/bin/bash
# Written by etachott

# Configuration and global variables
set +h
set -e
umask 022
LFS=/mnt/lfs
LFS_SOURCES=$LFS/sources
LC_ALL=POSIX
LFS_TGT=$(uname -m)-ft-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
RECIPE_DIR="$LFS/ft_linux/recipes/tools"
MAKEFLAGS="-j 12"

# Recipe installation loop

for recipe in "$RECIPE_DIR"/*.sh; do
	source "$recipe"

	if is_installed; then
		echo ">> Package $(basename "$recipe") already installed!"
		continue
	fi

	echo
	echo "============================================================"
	echo "  Building: $(basename "$recipe")"
	echo "============================================================"
	echo

	echo ">> Extracting package..."
	tar -xf "$LFS_SOURCES/$RECIPE_TAR" -C $LFS_SOURCES

	echo ">> Building package $RECIPE_NAME..."
	cd "$LFS_SOURCES/$RECIPE_NAME"
	build

	echo ">> Cleaning up dir..."
	cd "$LFS_SOURCES"
	rm -rf "$LFS_SOURCES/$RECIPE_NAME"

	echo 
	echo "============================================================"
	echo "  Finished: $(basename "$recipe")"
	echo "============================================================"
done

echo
echo "Toolchain compiled and installed successfully!"
