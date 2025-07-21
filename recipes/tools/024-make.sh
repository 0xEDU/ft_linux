# Written by etachott

RECIPE_NAME="make-4.1"
RECIPE_TAR="make-4.1.tar.bz2"

build() {
	./configure --prefix=/tools --without-guile
	make
	make install

}

is_installed() {
	local sample_file="make"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
