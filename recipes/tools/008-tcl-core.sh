# Written by etachott

RECIPE_NAME="tcl8.6.4"
RECIPE_TAR="tcl-core8.6.4-src.tar.gz"

build() {
	cd unix
	./configure --prefix=/tools
	make
	make install
	chmod -v u+w /tools/lib/libtcl8.6.so
	make install-private-headers
	ln -sv tclsh8.6 /tools/bin/tclsh

}

is_installed() {
	local sample_file="tclsh"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
