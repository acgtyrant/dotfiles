# Intialization

  ## Set the hostname
  echo "Set the hostname to ArchE540..."
  echo ArchE540 > /etc/hostname
  sleep 1; echo "Done."
  ## Set the timezone
  echo "Set the timezone to Shanghai..."
  ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
  sleep 1; echo "Done."
  ## Set the locale
  echo "Export the locale..."
  sed -i "s/#en_US\.UTF-8 UTF-8/en_US\.UTF-8 UTF-8/" /etc/locale.gen
  sed -i "s/#zh_CN\.UTF-8 UTF-8/zh_CN\.UTF-8 UTF-8/" /etc/locale.gen
  locale-gen
  echo "LANG=en_US.UTF-8 UTF-8" > /etc/locale.conf
  sleep 1; echo "Done."
  ## Set the hwclock
  echo "Set the hwclock..."
  hwclock --systohc --utc
  sleep 1; echo "Done."
  ## Set the passwd
  echo "Set the root passwd..."
  passwd
  sleep 1; echo "Done."

# System administration

  ## Users and groups
  echo "Set the user: acgtyrant..."
  useradd -m -G wheel -s /bin/bash acgtyrant
  echo "The user is created, input the new password now."
  passwd acgtyrant
  sleep 1; echo "Done."

  ## Privilege escalation
  echo "sudo is in the `base` group already, but gksu is not."
  sleep 1; pacman -S --noconfirm --needed gksu
  echo "and exec visudo to edit /etc/sudoers immediately."
  echo "just uncomment '%wheel ALL =(ALL) ALL'."
  sleep 2; visudo
  sleep 1; echo "Done."

  ## Service management TODO

  ## System maintenance TODO

# Package management

## pacman TODO

  ## Repositories
  echo "Uncommnet multilab, testing and so on."
  sleep 2; vim /etc/pacman.conf

  ## Arch Build System

  ## Arch User Repository TODO
  # AUR Helper yaourt
  echo "Install yaourt manually now..."
  curl -O https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
  tar zxvf package-query.tar.gz
  cd package-query
  makepkg -si
  cd ..
  curl -O https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
  tar zxvf yaourt.tar.gz
  cd yaourt
  makepkg -si
  cd ..
  rm -r package-query.tar.gz package-query yaourt.tar.gz yaourt
  sleep 1; echo "Now you can use yaourt."
  yaourt -S pkgstat

  ## Mirrors
  # rank mirrors
  echo "Rank the mirrorlist now..."
  yaourt -S --noconfirm --needed reflector
  sudo reflector --verbose --country 'China' -l 5 -p http --sort rate --save /etc/pacman.d/mirrorlist
  sleep 1; echo "Done."

# Graphical user interface

  ## Display drivers
  # Bumblebee
  yaourt -S --noconfirm --needed bumblebee bbswitch primus virtualgl \
    lib32-primus lib32-virtualgl mesa mesa-demos xf86-video-intel nvidia \
    lib32-nvidia-utils lib32-mesa-libgl lib32-mesa
  gpasswd -a acgtyrant bumblebee
  systemctl enable bumblebeed.service

  # Display server
  yaourt -S --noconfirm --needed xorg-server compton lxrandr xorg-xmodmap

  # Windows managers
  yaourt -S --noconfirm --needed i3 conky

  # Display manager
  yaourt -S --noconfirm --needed xorg-xinit

# Audio/video

## Sound
yaourt -S --noconfirm --needed alsa-utils pulseaudio paprefs pavucontrol \
  pulseaudio-alsa

## Browser plugins TODO

## Codecs TODO

# Networking TODO

# Booting TODO

# Power management TODO
yaourt -S acpi

# Input devices TODO
yaourt -S --noconfirm --needed xf86-input-synaptics

# Optimization TODO

# System service TODO

# Appearance
yaourt -S --noconfirm --needed lxappearance

## Fonts
echo "Installing fonts..."
yaourt -S --noconfirm --needed wqy-zenhei wqy-microhei adobe-source-han-sans-cn-fonts otf-hermita ttf-ubuntu-font-family
sleep 1; echo "Done."

## GTK and Qt themes
yaourt -S paper-gtk-theme-git
#lxappearance

# Console improvements

## Alternative shells
yaourt -S --noconfirm --needed zsh
chsh -s /bin/zsh acgtyrant
# oh-my-zsh

## Compressed files
yaourt -S --noconfirm --needed unzip zip p7zip unrar file-roller

## Session management
yaourt -S --noconfirm --needed tmux

# Applications

## Proxy
yaourt -S --noconfirm --needed shadowsocks python2-m2crypto cow-proxy

## Launcher

yaourt -S --noconfirm --needed dmenu synapse

## Browser

yaourt -S --noconfirm --needed chromium chromium-pepper-flash firefox opera

## Editor

yaourt -S --noconfirm --needed gvim gedit haroopad

## File manager
yaourt -S --noconfirm --needed ranger nautilus

## IME
yaourt -S --noconfirm --needed fcitx-im fcitx-rime fcitx-configtool fcitx-qt5

## Photoshop
yaourt -S --noconfirm --needed gimp

## PDF Reader
yaourt -S --noconfirm --needed evince

# Preferences

## Git
yaourt -S --noconfirm --needed git tig xclip

## Instant Message
yaourt -S --noconfirm --needed hexchat

## Game
yaourt -S --noconfirm --needed steam

## Office
#wpsoffice wpsoffice-common wpsoffice-zh-CN
#texmacs

## Note Software
#wiznote

## Cloud backup
yaourt -S --noconfirm --needed nutstore nautilus-nutstore

## Screenshot
yaourt -S --noconfirm --needed scrot

## Remote desktop
yaourt -S --noconfirm --needed teamviewer

## System info
yaourt -S --noconfirm --needed alsi cpu-g hardinfo

## Safe plusgins
yaourt -S --noconfirm --needed upeditor

## Bitrront
yaourt -S --noconfirm --needed deluge

## Monitor
yaourt -S --noconfirm --needed htop gnome-system-monitor alsi

## Video player
#yaourt -S --noconfirm --needed

## diff
yaourt -S --noconfirm --needed meld

## Hash checker
yaourt -S --noconfirm --needed gtkhash

## Calculator
yaourt -S --noconfirm --needed gnome-calculator

## Calender
#starcal2

## Terminal emulator
yaourt -S --noconfirm --needed tilda

## Others
yaourt -S --noconfirm --needed cmatrix xmind baobab mentohust-bin deadbeef \
  aegisub feh weatherboy whois create_ap openssh linux-headers rescuetime \
  autojump tree

# Preference
#git clone git@github.com:acgtyrant/bin.git /home/acgtyrant/bin
#git clone git@github.com:acgtyrant/dotfiles.git /home/acgtyrant/dotfiles
#git clone git@github.com:robbyrussell/oh-my-zsh.git /home/acgtyrant/.oh-my-zsh
yaourt -S --noconfirm --needed stow
#stow

# Development
yarout -S --no-confirm --needed git gitg ix rust python clang cmake gdb \
  valgrind nodejs dnsutils ctags gist
