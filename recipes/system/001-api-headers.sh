# Written by etachott

RECIPE_NAME="linux-4.4.2"
RECIPE_TAR="linux-4.4.2.tar.xz"

build() {
	make mrproper
	make INSTALL_HDR_PATH=dest headers_install
	find dest/include \( -name .install -o -name ..install.cmd \) -delete
	cp -rv dest/include/* /usr/include
}

is_installed() {
	local sample_file="/usr/include/asm/boot.h"
	

	if [ -f "$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
