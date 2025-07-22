# Written by etachott

RECIPE_NAME="file-5.25"
RECIPE_TAR="file-5.25.tar.gz"

build() {
	./configure --prefix=/usr
	make
	make install

}

is_installed() {
	local sample_file="/usr/bin/file"

	if [ -f "$sample_file" ]; then
		return 0
	else
		return 1
	fi
}

