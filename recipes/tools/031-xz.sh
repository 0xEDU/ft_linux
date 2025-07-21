# Written by etachott

RECIPE_NAME="xz-5.2.2"
RECIPE_TAR="xz-5.2.2.tar.xz"

build() {
	./configure --prefix=/tools
	make
	make install

}

is_installed() {
	local sample_file="xz"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
