# Written by etachott

RECIPE_NAME="dejagnu-1.5.3"
RECIPE_TAR="dejagnu-1.5.3.tar.gz"

build() {
	./configure --prefix=/tools
	make install
	make check

}

is_installed() {
	local sample_file="runtest"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
