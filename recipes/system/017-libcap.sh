# Written by etachott

RECIPE_NAME="libcap-2.25"
RECIPE_TAR="libcap-2.25.tar.xz"

build() {
	sed -i '/install.*STALIBNAME/d' libcap/Makefile
	make
	make RAISE_SETFCAP=no prefix=/usr install
	chmod -v 755 /usr/lib/libcap.so
	mv -v /usr/lib/libcap.so.* /lib
	ln -sfv ../../lib/$(readlink /usr/lib/libcap.so) /usr/lib/libcap.so

}

is_installed() {
	local sample_file="/usr/sbin/getcap"

	if [ -f "$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
