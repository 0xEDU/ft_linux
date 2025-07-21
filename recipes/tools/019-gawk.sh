# Written by etachott

RECIPE_NAME="gawk-4.1.3"
RECIPE_TAR="gawk-4.1.3.tar.xz"

build() {
	./configure --prefix=/tools
	make
	make install

}

is_installed() {
	local sample_file="gawk"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
