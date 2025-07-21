#!/bin/bash
# Written by etachott

chroot "$LFS" /tools/bin/env -i \
	HOME=/root \
	TERM="$TERM" \
	PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
	/tools/bin/bash --login +h /ft_linux/system/installer.sh
