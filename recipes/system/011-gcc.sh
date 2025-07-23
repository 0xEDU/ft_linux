# Written by etachott

RECIPE_NAME="gcc-5.3.0"
RECIPE_TAR="gcc-5.3.0.tar.bz2"

build() {
	mkdir -v build
	cd build
	SED=sed \
	../configure --prefix=/usr \
		--enable-languages=c,c++ \
		--disable-multilib \
		--disable-bootstrap \
		--with-system-zlib
	make
	ulimit -s 32768
	make -k check
	make install
	ln -sv ../usr/bin/cpp /lib
	ln -sv gcc /usr/bin/cc
	install -v -dm755 /usr/lib/bfd-plugins
	ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/5.3.0/liblto_plugin.so \
		/usr/lib/bfd-plugins/
	mkdir -pv /usr/share/gdb/auto-load/usr/lib
	mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib

}

is_installed() {
	local sample_file="/usr/bin/gcc"

	if [ -f "$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
