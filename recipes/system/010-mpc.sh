# Written by etachott

RECIPE_NAME="mpc-1.0.3"
RECIPE_TAR="mpc-1.0.3.tar.gz"

build() {
	./configure --prefix=/usr \
		--disable-static \
		--docdir=/usr/share/doc/mpc-1.0.3
	make
	make html
	make check
	make install
	make install-html
}

is_installed() {
	local sample_file="/usr/lib/libmpc.so"

	if [ -f "$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
