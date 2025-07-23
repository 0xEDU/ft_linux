# Written by etachott

RECIPE_NAME="shadow-4.2.1"
RECIPE_TAR="shadow-4.2.1.tar.xz"

build() {
	sed -i 's/groups$(EXEEXT) //' src/Makefile.in
	find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \;
	find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \;
	find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \;
	sed -i -e 's@#ENCRYPT_METHOD DES@ENCRYPT_METHOD SHA512@' \
	       -e 's@/var/spool/mail@/var/mail@' etc/login.defs
	sed -i 's/1000/999/' etc/useradd
	./configure --sysconfdir=/etc --with-group-name-max-length=32
	make
	make install
	mv -v /usr/bin/passwd /bin
	pwconv
	grpconv
}

is_installed() {
	local sample_file="/bin/passwd"

	if [ -f "$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
