# Set the hostname
echo "Set the hostname..."
echo ArchE540 > /etc/hostname
sleep 1; echo "Done."
# Set the timezone
echo "Set the timezone..."
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
sleep 1; echo "Done."
# Set the locale
echo "Set the locale..."
sed -i "s/#en_US\.UTF-8 UTF-8/en_US\.UTF-8 UTF-8/" /etc/locale.gen
sed -i "s/#zh_CN\.UTF-8 UTF-8/zh_CN\.UTF-8 UTF-8/" /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8 UTF-8" > /etc/locale.conf
sleep 1; echo "Done."
# Set the hwclock
hwclock --systohc --utc
# Set the passwd
echo "Set the root passwd..."
passwd
sleep 1; echo "Done."

# Set the bootloader...

  # System administration

  ## Users and groups
  echo "Set the user: acgtyrant..."
  useradd -m -G wheel -s /bin/bash acgtyrant
  passwd acgtyrant

  ## Privilege escalation
  echo "sudo is in the `base` group already, but gksu is not."
  sleep 1; pacman -S --noconfirm --needed gksu
  echo "and exec visudo to edit /etc/sudoers immediately."
  echo "just uncomment '%wheel ALL =(ALL) ALL'."
  visudo
  sleep 1; echo "Done."

  ## Service management TODO

  ## System maintenance TODO

# Package management

## pacman TODO

  ## Repositories TODO
  # uncommnet multilab

  ## Arch Build System TODO
  # mkdir ~/abs

  ## Arch User Repository TODO
  # AUR Helper yaourt
  sleep 1; echo "now you can use yaourt."

  ## Mirrors
  # rank mirrors

# Graphical user interface

  ## Display drivers TODO
  # Bumblebee
  pacman -S --noconfirm --needed bumblebee bbswitch primus virtualgl lib32-primus \
  lib32-virtualgl mesa mesa-demos xf86-video-intel nvidia lib32-nvidia-utils \
  lib32-mesa-libgl lib32-mesa 
  gpasswd -a acgtyrant bumblebee
  systemctl enable bumblebeed.service

  # Display server TODO
  pacman -S --noconfirm --needed xorg-server
  pacman -S --noconfirm --needed compton
  lxrandr 

  # Windows managers TODO
  pacman -S --noconfirm --needed i3 conky

  # Display manager TODO
  pacman -S --noconfirm --needed xorg-xinit

# Audio/video

## Sound TODO
pacman -S --noconfirm --needed alsa-utils
pacman -S --noconfirm --needed pulseaudio paprefs pavucontrol

## Browser plugins TODO

## Codecs TODO

# Networking TODO

# Booting TODO

# Power management TODO

# Input devices TODO
pacman -S --noconfirm --needed xf86-input-synaptics

# Optimization TODO

# System service TODO

# Appearance

## Fonts
echo "Installing fonts..."
pacman -S --noconfirm --needed wqy-zenhei wqy-microhei adobe-source-han-sans-cn-fonts otf-hermit
sleep 1; echo "Done."

## GTK and Qt themes
#yaourt -S moka* TODO
lxappearance 

# Console improvements

## Alternative shells
pacman -S zsh
chsh -s /bin/zsh acgtyrant
# oh-my-zsh

## Compressed files
pacman -S --noconfirm --needed unzip zip p7zip unrar file-roller

## Session management
pacman -S --noconfirm --needed tmux

# Applications

## Proxy
pacman -S goagent shadowsocks python2-m2crypto cow-proxy

## Launcher

dmenu synapse

## Browser

chromium
chromium-pepper-flash chromium-libpdf 

## Edirot

gvim gedit haroopad

## File manager
nautilus

## IME
fcitx-im fcitx-rime fcitx-configtool

## Photoshop
gimp

## PDF Reader
evince

# Preferences

## Git
pacman -S git tig
pacman -S xclip

## Instant Message
hexchat
skype 

## Game
steam

## Office
wpsoffice wpsoffice-common wpsoffice-zh-CN
texmacs 

## Note Software
wiznote

## Cloud backup
nutstore nautilus-nutstore 

## Screenshot
scrot deepin-screenshot

## Remote desktop
teamviewer

## System info
alsi cpu-g hardinfo

## Safe plusgins
upeditor 

## Bitrront
deluge 

## Monitor
htop gnome-system-monitor alsi

## Video player
smplayer vlc gnome-player

## diff
meld

## Hash checker
gtkhash

## Calculator
gnome-calculator

## Calender
starcal2

## Terminal emulator
tilda

## Others
cmatrix xmind baobab gparted wicd-gtk
yarout -S nodejs-hexo mentohust-bin deadbeef catfish aegisub
feh weatherboy whois 

# Preference
git clone git@github.com/acgtyrant/bin.git /home/acgtyrant/bin
git clone git@github.com/acgtyrant/dotfiles.git /home/acgtyrant/dotfiles
pacman -S --noconfirm --needed stow
stow

create_ap openssh linux-headers
