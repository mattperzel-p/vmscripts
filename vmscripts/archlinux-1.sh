#second script
pacman -Syu
pacman -S --noconfirm sudo openssh python2 vim curl base-devel openssl
echo "alias vi='vim'" >> .bashrc
rc.d start sshd
vim /etc/rc.conf
echo "%sudo ALL=(ALL) ALL" >> /etc/sudoers
curl http://python-distribute.org/distribute_setup.py | python2
curl https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python
pacman -S --noconfirm git

useradd -m -g sudo matt
passwd matt