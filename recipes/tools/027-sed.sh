# Written by etachott

RECIPE_NAME="sed-4.2.2"
RECIPE_TAR="sed-4.2.2.tar.bz2"

build() {
	./configure --prefix=/tools
	make
	make install

}

is_installed() {
	local sample_file="sed"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
