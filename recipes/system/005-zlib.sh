# Written by etachott

RECIPE_NAME="zlib-1.2.8"
RECIPE_TAR="zlib-1.2.8.tar.xz"

build() {
	./configure --prefix=/usr
	make
	make check
	make install
	mv -v /usr/lib/libz.so.* /lib
	ln -sfv ../../lib/$(readlink /usr/lib/libz.so) /usr/lib/libz.so

}

is_installed() {
	local sample_file="/usr/lib/libz.so"

	if [ -f "$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
