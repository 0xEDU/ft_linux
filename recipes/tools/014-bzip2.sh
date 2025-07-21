# Written by etachott

RECIPE_NAME="bzip2-1.0.6"
RECIPE_TAR="bzip2-1.0.6.tar.gz"

build() {
	make
	make PREFIX=/tools install

}

is_installed() {
	local sample_file="bzip2"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
