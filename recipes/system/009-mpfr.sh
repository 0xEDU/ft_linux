# Written by etachott

RECIPE_NAME="mpfr-3.1.3"
RECIPE_TAR="mpfr-3.1.3.tar.xz"

build() {
	patch -Np1 -i ../mpfr-3.1.3-upstream_fixes-2.patch
	./configure --prefix=/usr \
		--disable-static \
		--enable-thread-safe \
		--docdir=/usr/share/doc/mpfr-3.1.3
	make
	make html
	make check
	make install
	make install-html
}

is_installed() {
	local sample_file="/usr/lib/libmpfr.so"

	if [ -f "$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
