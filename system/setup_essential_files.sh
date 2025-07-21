# Written by etachott

set -e

# Setup symlinks that will be replaced after packages installation
ln -sv /tools/bin/{bash,cat,echo,pwd,stty} /bin
ln -sv /tools/bin/perl /usr/bin
ln -sv /tools/lib/libgcc_s.so{,.1} /usr/lib
ln -sv /tools/lib/libstdc++.so{,.6} /usr/lib
sed 's/tools/usr/' /tools/lib/libstdc++.la > /usr/lib/libstdc++.la
ln -sv bash /bin/sh
ln -sv /proc/self/mounts /etc/mtab 
# Create passwd file
cp /ft_linux/system/skel/passwd /etc/passwd

# Create groups file
cp /ft_linux/system/skel/group /etc/group

# Init log files
touch /var/log/{btmp,lastlog,wtmp}
chgrp -v utmp /var/log/lastlog
chmod -v 664  /var/log/lastlog
chmod -v 600  /var/log/btmp
