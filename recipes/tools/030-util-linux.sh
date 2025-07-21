# Written by etachott

RECIPE_NAME="util-linux-2.27.1"
RECIPE_TAR="util-linux-2.27.1.tar.xz"

build() {
	./configure --prefix=/tools \
		--without-python \
		--disable-makeinstall-chown \
		--without-systemdsystemunitdir \
		PKG_CONFIG=""
	make
	make install

}

is_installed() {
	local sample_file="mount"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
