# Written by etachott

RECIPE_NAME="m4-1.4.17"
RECIPE_TAR="m4-1.4.17.tar.xz"

build() {
	./configure --prefix=/tools
	make
	make install

}

is_installed() {
	local sample_file="m4"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
