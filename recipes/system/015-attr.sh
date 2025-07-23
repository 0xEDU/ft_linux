# Written by etachott

RECIPE_NAME="attr-2.4.47"
RECIPE_TAR="attr-2.4.47.src.tar.gz"

build() {
	sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in
	sed -i -e "/SUBDIRS/s|man[25]||g" man/Makefile
	./configure --prefix=/usr \
		--bindir=/bin \
		--disable-static
	make
	make -j1 tests root-tests
	make install install-dev install-lib
	chmod -v 755 /usr/lib/libattr.so
	mv -v /usr/lib/libattr.so.* /lib
	ln -sfv ../../lib/$(readlink /usr/lib/libattr.so) /usr/lib/libattr.so
}

is_installed() {
	local sample_file="/bin/attr"

	if [ -f "$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
