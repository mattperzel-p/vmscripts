#!/bin/sh
die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 1 ] || die "1 argument required, $# provided"

pacman -Syu --noconfirm
pacman -S --noconfirm sudo openssh python2 vim curl base-devel openssl
pacman -S --noconfirm git
echo "alias vi='vim'" >> .bashrc

echo "%sudo ALL=(ALL) ALL" >> /etc/sudoers

cp /etc/rc.conf /etc/rc.conf.bkup
sed -e 's/\(DAEMONS=(\)\(.*\))/\1\2 sshd)/' /etc/rc.conf.bkup > /etc/rc.conf

groupadd sudo
useradd -m -g sudo %1
passwd %1

wget -O /home/%1/usersetup.sh https://raw.github.com/thectrain/vmscripts/master/vmscripts/archlinux-2.sh
exit
