# Written by etachott

RECIPE_NAME="linux-4.4.2"
RECIPE_TAR="linux-4.4.2.tar.xz"

build() {
	make mrproper
	make INSTALL_HDR_PATH=dest headers_install
	cp -rv dest/include/* /tools/include
}

is_installed() {
	local sample_file="asm/boot.h"
	

	if [ -f "$LFS/tools/include/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
