# Written by etachott

RECIPE_NAME="binutils-2.26"
RECIPE_TAR="binutils-2.26.tar.bz2"

build() {
	patch -Np1 -i ../binutils-2.26-upstream_fix-2.patch

	mkdir -v build
	cd build
	../configure --prefix=/usr \
		--enable-shared \
		--disable-werror
	make tooldir=/usr
	make check
	make tooldir=/usr install

}

is_installed() {
	local sample_file="/usr/bin/objdump"

	if [ -f "$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
