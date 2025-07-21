# Written by etachott

RECIPE_NAME="coreutils-8.25"
RECIPE_TAR="coreutils-8.25.tar.xz"

build() {
	./configure --prefix=/tools --enable-install-program=hostname
	make
	make install

}

is_installed() {
	local sample_file="ls"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
