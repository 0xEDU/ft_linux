# Written by etachott

RECIPE_NAME="gettext-0.19.7"
RECIPE_TAR="gettext-0.19.7.tar.xz"

build() {
	cd gettext-tools
	EMACS="no" ./configure --prefix=/tools --disable-shared

	make -C gnulib-lib
	make -C intl pluralx.c
	make -C src msgfmt
	make -C src msgmerge
	make -C src xgettext

	cp -v src/{msgfmt,msgmerge,xgettext} /tools/bin
}

is_installed() {
	local sample_file="msgfmt"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
