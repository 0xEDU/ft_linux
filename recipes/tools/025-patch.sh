# Written by etachott

RECIPE_NAME="patch-2.7.5"
RECIPE_TAR="patch-2.7.5.tar.xz"

build() {
	./configure --prefix=/tools
	make
	make install

}

is_installed() {
	local sample_file="patch"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
