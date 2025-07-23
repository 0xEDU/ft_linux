# Written by etachott

RECIPE_NAME="psmisc-22.21"
RECIPE_TAR="psmisc-22.21.tar.gz"

build() {
	./configure --prefix=/usr
	make
	make install
	mv -v /usr/bin/fuser /bin
	mv -v /usr/bin/killall /bin

}

is_installed() {
	local sample_file="/bin/fuser"

	if [ -f "$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
