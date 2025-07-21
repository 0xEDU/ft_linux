#!/bin/bash
# Written by etachott

LFS=/mnt/lfs/sources

# Remove all directories in sources dir, leaving only tarballs and patches
find $LFS -mindepth 1 -maxdepth 1 -type d -exec rm -r {} \;
