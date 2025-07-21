# Written by etachott

RECIPE_NAME="expect5.45"
RECIPE_TAR="expect5.45.tar.gz"

build() {
	# Force use of /bin/stty
	cp -v configure{,.orig}
	sed 's:/usr/local/bin:/bin:' configure.orig > configure

	./configure --prefix=/tools \
		--with-tcl=/tools/lib \
		--with-tclinclude=/tools/include
	make
	make SCRIPTS="" install

}

is_installed() {
	local sample_file="expect"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
