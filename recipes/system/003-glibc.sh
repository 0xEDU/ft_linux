# Written by etachott

RECIPE_NAME="glibc-2.23"
RECIPE_TAR="glibc-2.23.tar.xz"

build() {
	patch -Np1 -i ../glibc-2.23-fhs-1.patch

	mkdir -v build
	cd build
	../configure --prefix=/usr \
		--disable-profile \
		--enable-kernel=2.6.32 \
		--enable-obsolete-rpc
	make

	make check

	touch /etc/ld.so.conf
	make install
	cp -v ../nscd/nscd.conf /etc/nscd.conf
	mkdir -pv /var/cache/nscd
	make localedata/install-locales

	cp -v /ft_linux/system/skel/nsswitch.conf /etc/nsswitch.conf

	tar -xf ../../tzdata2016a.tar.gz

	ZONEINFO=/usr/share/zoneinfo
	mkdir -pv $ZONEINFO/{posix,right}

	for tz in etcetera southamerica northamerica europe africa antarctica  \
		asia australasia backward pacificnew systemv; do
		zic -L /dev/null   -d $ZONEINFO       -y "sh yearistype.sh" ${tz}
		zic -L /dev/null   -d $ZONEINFO/posix -y "sh yearistype.sh" ${tz}
		zic -L leapseconds -d $ZONEINFO/right -y "sh yearistype.sh" ${tz}
	done

	cp -v zone.tab zone1970.tab iso3166.tab $ZONEINFO
	zic -d $ZONEINFO -p America/Sao_Paulo
	unset ZONEINFO

	cp -v /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

	cp -v /ft_linux/system/skel/ld.so.conf /etc/ld.so.conf

}

is_installed() {
	local sample_file="/bin/ldd"

	if [ -f "$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
