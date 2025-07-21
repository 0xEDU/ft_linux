# Written by etachott

RECIPE_NAME="perl-5.22.1"
RECIPE_TAR="perl-5.22.1.tar.bz2"

build() {
	sh Configure -des -Dprefix=/tools -Dlibs=-lm
	make
	cp -v perl cpan/podlators/pod2man /tools/bin
	mkdir -pv /tools/lib/perl5/5.22.1
	cp -Rv lib/* /tools/lib/perl5/5.22.1

}

is_installed() {
	local sample_file="perl"

	if [ -f "$LFS/tools/bin/$sample_file" ]; then
		return 0
	else
		return 1
	fi
}
