# Written by etachott

RECIPE_NAME="pkg-config-0.29"
RECIPE_TAR="pkg-config-0.29.tar.gz"

build() {
	./configure --prefix=/usr \
		--with-internal-glib \
		--disable-host-tool \
		--docdir=/usr/share/doc/pkg-config-0.29
	make
	make check
	make install

}

is_installed() {
	local sample_file="/usr/bin/pkg-config"

	if [ -f "$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
