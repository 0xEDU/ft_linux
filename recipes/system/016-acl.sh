# Written by etachott

RECIPE_NAME="acl-2.2.52"
RECIPE_TAR="acl-2.2.52.src.tar.gz"

build() {
	sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in
	sed -i "s:| sed.*::g" test/{sbits-restore,cp,misc}.test
	sed -i -e "/TABS-1;/a if (x > (TABS-1)) x = (TABS-1);" \
		libacl/__acl_to_any_text.c
	./configure --prefix=/usr \
		--bindir=/bin \
		--disable-static \
		--libexecdir=/usr/lib
	make
	make install install-dev install-lib
	chmod -v 755 /usr/lib/libacl.so
	mv -v /usr/lib/libacl.so.* /lib
	ln -sfv ../../lib/$(readlink /usr/lib/libacl.so) /usr/lib/libacl.so

}

is_installed() {
	local sample_file="/bin/chacl"

	if [ -f "$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
