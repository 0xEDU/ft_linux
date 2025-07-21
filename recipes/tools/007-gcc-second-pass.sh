# Written by etachott

RECIPE_NAME="gcc-5.3.0"
RECIPE_TAR="gcc-5.3.0.tar.bz2"

build() {
	# Move limit header
	cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
		  `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/include-fixed/limits.h

	# Change the location of GCC's default dynamic linker to use /tools' and
	# remove /usr/include from it's search path
	for file in \
		$(find gcc/config -name linux64.h -o -name linux.h -o -name sysv4.h)
	do
		cp -uv $file{,.orig}
		sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
			-e 's@/usr@/tools@g' $file.orig > $file
				echo '
				#undef STANDARD_STARTFILE_PREFIX_1
				#undef STANDARD_STARTFILE_PREFIX_2
				#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"
				#define STANDARD_STARTFILE_PREFIX_2 ""' >> $file
		touch $file.orig
	done

	# Move dependencies in
	tar -xf ../mpfr-3.1.3.tar.xz
	mv -v mpfr-3.1.3 mpfr
	tar -xf ../gmp-6.1.0.tar.xz
	mv -v gmp-6.1.0 gmp
	tar -xf ../mpc-1.0.3.tar.gz
	mv -v mpc-1.0.3 mpc

	# Building
	mkdir -v build
	cd build
	CC=$LFS_TGT-gcc \
	CXX=$LFS_TGT-g++ \
	AR=$LFS_TGT-ar \
	RANLIB=$LFS_TGT-ranlib \
	../configure \
		--prefix=/tools \
		--with-local-prefix=/tools \
		--with-native-system-header-dir=/tools/include \
		--enable-languages=c,c++ \
		--disable-libstdcxx-pch \
		--disable-multilib \
		--disable-bootstrap \
		--disable-libgomp
	make
	make install
	ln -sv gcc /tools/bin/cc
}

is_installed() {
	local sample_file="cc"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
