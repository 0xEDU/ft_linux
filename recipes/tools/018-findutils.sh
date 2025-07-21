# Written by etachott

RECIPE_NAME="findutils-4.6.0"
RECIPE_TAR="findutils-4.6.0.tar.gz"

build() {
	./configure --prefix=/tools
	make
	make install

}

is_installed() {
	local sample_file="find"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
