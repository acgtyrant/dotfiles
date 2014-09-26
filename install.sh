#base-devel
#nano /etc/locale.gen 
locale-gen 
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc
echo ThinkPad.acgtyrant.com > /etc/hostname
#
pacman -S sudo alsi feh acpi scrot xclip git tig clang cmake htop gdb ntpdate weatherboy whois create_ap unzip zip p7zip unrar file-roller dmenu conky su openssh gcc linux-headers wgetpaste cmatrix stow
chmod u+w /etc/sudoers
#vim /etc/sudoers
chmod u-w /etc/sudoers
useradd -m -g users -G wheel,storage,power -s /bin/bash acgtyrant
passwd 
# Cuntomize mirrorlist and set up proxy.
#reflector
pacman -S goagent shadowsocks python2-m2crypto cow-proxy
# Edit pacman.conf
yaourt
# Oh-My-Zsh
# Driver, xorg, windows manager
yain xorg-server xorg-xinit xf86-input-synaptics alsa-utils pulseaudio pavucontrol pulseaudio-alsa xf86-video-intel intel-dri
# Some utilities
git clone git@github.com/acgtyrant/bin.git /home/acgtyrant/bin
git clone git@github.com/acgtyrant/dotfiles.git /home/acgtyrant/dotfiles
# Favourite software
yain rxvt-unicode-multi_display-256xresources urxvt-perls-git i3 chromium chromium-pepper-flash chromium-libpdf spacefm nautilus meld hexchat haroopad gedit mcomic lxrandr fcitx-rime nodejs-hexo mentohust-bin acroread deluge vlc deadbeef catfish gnome-system-monitor synapse deepin-screenshot tmux wpsoffice wpsoffice-common wpsoffice-zh-CN lxappearance steam nutstore nautilus-nutstore fcitx-configtool fcitx-im smplayer texmacs
# Font
yain wqy-zenhei wqy-microhei adobe-source-han-sans-fonts acroread-fonts 
# Theme
yain stark-gtk-git moka-gtk-git moka-icons-git
# Optional Software
yain xmind baobab mcomix skype wineqq emacs sage-mathematics gparted gimp hardinfo teamviewer cpu-g gimp upeditor wicd-gtk gnome-calculator wiznote starcal2 gtkhash
# Develop Tool
yain jdk8-openjdk eclipse python-docs python2-docs 
