# Written by etachott

RECIPE_NAME="glibc-2.23"
RECIPE_TAR="glibc-2.23.tar.xz"

build() {
	mkdir -v build
	cd build

	../configure \
		--prefix=/tools \
		--host=$LFS_TGT \
		--build=$(../scripts/config.guess) \
		--disable-profile \
		--enable-kernel=2.6.32 \
		--enable-obsolete-rpc \
		--with-headers=/tools/include \
		libc_cv_forced_unwind=yes \
		libc_cv_ctors_header=yes \
		libc_cv_c_cleanup=yes
	make
	make install

}

is_installed() {
	local sample_file="ldd"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
