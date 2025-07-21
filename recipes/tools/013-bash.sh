# Written by etachott

RECIPE_NAME="bash-4.3.30"
RECIPE_TAR="bash-4.3.30.tar.gz"

build() {
	./configure --prefix=/tools --without-bash-malloc
	make
	make install
	ln -sv bash /tools/bin/sh

}

is_installed() {
	local sample_file="bash"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
