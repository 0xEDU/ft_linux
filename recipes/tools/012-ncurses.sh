# Written by etachott

RECIPE_NAME="ncurses-6.0"
RECIPE_TAR="ncurses-6.0.tar.gz"

build() {
	sed -i s/mawk// configure
	./configure --prefix=/tools \
		--with-shared \
		--without-debug \
		--without-ada \
		--enable-widec \
		--enable-overwrite
	make
	make install

}

is_installed() {
	local sample_file="tset"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
