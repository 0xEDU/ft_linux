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

for recipe in "$RECIPE_DIR"/*.sh; do
	echo
	echo "============================================================"
	echo "  Building: $(basename "$recipe")"
	echo "============================================================"

	source "$recipe"

	echo ">> Extracting package..."
	tar -xf "$LFS_SOURCES/$RECIPE_TAR" -C $LFS_SOURCES

	echo ">> Building package $RECIPE_NAME..."
	build

	echo ">> Cleaning up dir..."
	rm -rf "$LFS_SOURCES/$RECIPE_NAME"

	echo "============================================================"
	echo "  Finished: $(basename "$recipe")"
	echo "============================================================"
done

echo
echo "Toolchain compiled and installed successfully!"
