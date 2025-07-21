# Written by etachott

RECIPE_NAME="diffutils-3.3"
RECIPE_TAR="diffutils-3.3.tar.xz"

build() {
	./configure --prefix=/tools
	make
	make install

}

is_installed() {
	local sample_file="diff"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
