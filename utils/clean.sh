#!/bin/bash
# Written by etachott

LFS=/mnt/lfs/sources

find $LFS -mindepth 1 -maxdepth 1 -type d -exec rm -r {} \;
