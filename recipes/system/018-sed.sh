# Written by etachott

RECIPE_NAME="sed-4.2.2"
RECIPE_TAR="sed-4.2.2.tar.bz2"

build() {
	./configure --prefix=/usr --bindir=/bin --htmldir=/usr/share/doc/sed-4.2.2
	make
	make html
	make check
	make install
	make -C doc install-html

}

is_installed() {
	local sample_file="/bin/sed"

	if [ -f "$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
