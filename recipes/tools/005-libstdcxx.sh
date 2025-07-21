# Written by etachott

RECIPE_NAME="gcc-5.3.0"
RECIPE_TAR="gcc-5.3.0.tar.bz2"

build() {
	mkdir -v build
	cd build
	../libstdc++-v3/configure \
		--host=$LFS_TGT \
		--prefix=/tools \
		--disable-multilib \
		--disable-nls \
		--disable-libstdcxx-threads \
		--disable-libstdcxx-pch \
		--with-gxx-include-dir="/tools/$LFS_TGT/include/c++/5.3.0"
	make
	make install
}

is_installed() {
	local sample_file="libstdc++.a"
	

	if [ -f "$LFS/tools/lib/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
