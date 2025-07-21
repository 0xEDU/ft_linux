# Written by etachott

RECIPE_NAME="gzip-1.6"
RECIPE_TAR="gzip-1.6.tar.xz"

build() {
	./configure --prefix=/tools
	make
	make install

}

is_installed() {
	local sample_file="gzip"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
