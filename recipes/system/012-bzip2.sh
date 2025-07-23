# Written by etachott

RECIPE_NAME="bzip2-1.0.6"
RECIPE_TAR="bzip2-1.0.6.tar.gz"

build() {
	patch -Np1 -i ../bzip2-1.0.6-install_docs-1.patch
	sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile
	sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile
	make -f Makefile-libbz2_so
	make clean
	make
	make PREFIX=/usr install
	cp -v bzip2-shared /bin/bzip2
	cp -av libbz2.so* /lib
	ln -sv ../../lib/libbz2.so.1.0 /usr/lib/libbz2.so
	rm -v /usr/bin/{bunzip2,bzcat,bzip2}
	ln -sv bzip2 /bin/bunzip2
	ln -sv bzip2 /bin/bzcat

}

is_installed() {
	local sample_file="/bin/bzip2"

	if [ -f "$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
