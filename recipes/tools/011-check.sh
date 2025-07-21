# Written by etachott

RECIPE_NAME="check-0.10.0"
RECIPE_TAR="check-0.10.0.tar.gz"

build() {
	PKG_CONFIG= ./configure --prefix=/tools
	make
	make install

}

is_installed() {
	local sample_file="checkmk"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
