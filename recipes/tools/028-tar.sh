# Written by etachott

RECIPE_NAME="tar-1.28"
RECIPE_TAR="tar-1.28.tar.xz"

build() {
	./configure --prefix=/tools
	make
	make install

}

is_installed() {
	local sample_file="tar"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
