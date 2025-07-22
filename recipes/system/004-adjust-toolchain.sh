# Written by etachott

RECIPE_NAME="linux-4.4.2"
RECIPE_TAR="linux-4.4.2.tar.xz"

build() {
	mv -v /tools/bin/{ld,ld-old}
	mv -v /tools/$(uname -m)-pc-linux-gnu/bin/{ld,ld-old}
	mv -v /tools/bin/{ld-new,ld}
	ln -sv /tools/bin/ld /tools/$(uname -m)-pc-linux-gnu/bin/ld

	gcc -dumpspecs | sed -e 's@/tools@@g' \
		-e '/\*startfile_prefix_spec:/{n;s@.*@/usr/lib/ @}' \
		-e '/\*cpp:/{n;s@$@ -isystem /usr/include@}' > \
		`dirname $(gcc --print-libgcc-file-name)`/specs
}

is_installed() {
	local sample_file="/tools/bin/ld-old"
	

	if [ -f "$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
