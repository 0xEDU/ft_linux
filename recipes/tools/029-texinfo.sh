# Written by etachott

RECIPE_NAME="texinfo-6.1"
RECIPE_TAR="texinfo-6.1.tar.xz"

build() {
	./configure --prefix=/tools
	make
	make install

}

is_installed() {
	local sample_file="makeinfo"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
