# Written by etachott

RECIPE_NAME="binutils-2.26"
RECIPE_TAR="binutils-2.26.tar.bz2"

build() {
	mkdir -v build
	cd build
	../configure --prefix=/tools \
		--with-sysroot=$LFS \
		--with-lib-path=/tools/lib \
		--target=$LFS_TGT \
		--disable-nls \
		--disable-werror
	make
	mkdir -v /tools/lib && ln -sv lib /tools/lib64
	make install

}

is_installed() {
	local sample_file="$LFS_TGT-ld"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
