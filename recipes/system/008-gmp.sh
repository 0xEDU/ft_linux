# Written by etachott

RECIPE_NAME="gmp-6.1.0"
RECIPE_TAR="gmp-6.1.0.tar.xz"

build() {
	./configure --prefix=/usr \
		--enable-cxx \
		--disable-static \
		--docdir=/usr/share/doc/gmp-6.1.0
	make
	make html
	make check 2>&1 | tee gmp-check-log
	awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log
	make install
	make install-html
}

is_installed() {
	local sample_file="/usr/lib/libgmp.so"

	if [ -f "$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
