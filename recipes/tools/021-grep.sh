# Written by etachott

RECIPE_NAME="grep-2.23"
RECIPE_TAR="grep-2.23.tar.xz"

build() {
	./configure --prefix=/tools
	make
	make install

}

is_installed() {
	local sample_file="grep"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
