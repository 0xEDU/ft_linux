# Written by etachott

RECIPE_NAME="man-pages-4.04"
RECIPE_TAR="man-pages-4.04.tar.xz"

build() {
	make install
}


is_installed() {
	local sample_file="/usr/share/man/man1/ldd.1"

	if [ -f "$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
