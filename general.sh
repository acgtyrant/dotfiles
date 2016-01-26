#!/usr/bin/env bash

# General recommendations
# https://wiki.archlinux.org/index.php/General_recommendations

username=acgtyrant
testing=true
multilib=true

# System administration

  ## Users and groups
  echo "Set the user..."
  useradd -m -G wheel -s /bin/zsh acgtyrant
  echo "The user is created, input the new password now."
  passwd acgtyrant
  sleep 1; echo "Done."

  ## Privilege escalation
  echo "sudo is in the `base` group already, but gksu is not."
  sleep 1; pacman -S --needed --noconfirm gksu
  echo "and exec visudo to edit /etc/sudoers immediately."
  echo "just uncomment '%wheel ALL =(ALL) ALL'."
  sleep 2; visudo
  sleep 1; echo "Done."

  ## Service management TODO
  # https://wiki.archlinux.org/index.php/Systemd
  ## System maintenance TODO
  # https://wiki.archlinux.org/index.php/System_maintenance
  # https://wiki.archlinux.org/index.php/Security

# Package management

  ## pacman TODO
  # https://wiki.archlinux.org/index.php/Pacman
  # https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks

  ## Repositories TODO
  # https://wiki.archlinux.org/index.php/Unofficial_user_repositories
  echo "Uncommnet multilab, testing and so on."
  if [ $multilib = true ]; then
    sed -i "s/#\[multilib\]\n#/\[mutilib\]\n" /etc/pacman.conf
  if [ $testing = true ]; then
    sed -i "s/#\[testing\]\n#/\[testing\]\n" /etc/pacman.conf
    sed -i "s/#\[community-testing\]\n#/\[community-testing\]\n" /etc/pacman.conf
      if [ $multilib = true ] ; then
        sed -i "s/#\[multilib-testing\]\n#/\[mutilib-testing\]\n" /etc/pacman.conf
      fi
  fi
  echo "Use vi to check..."
  vi /etc/pacman.conf
  sleep 1; echo "Done."

  ## Arch Build System

  ## Arch User Repository TODO
  # https://wiki.archlinux.org/index.php/AUR_helpers
  echo "Install yaourt manually now..."
  wget https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz
  tar zxvf package-query.tar.gz
  cd package-query
  makepkg -si
  cd ..
  wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz
  tar zxvf yaourt.tar.gz
  cd yaourt
  makepkg -si
  cd ..
  rm -r package-query.tar.gz package-query yaourt.tar.gz yaourt
  sleep 1; echo "Now you can use yaourt."
  yaourt -S --needed --noconfirm pkgstats pkgfile pkgtools pkgdiff

  ## Mirrors

# Booting

  ## Hardware auto-recognition TODO
  # https://wiki.archlinux.org/index.php/Udev
  # https://wiki.archlinux.org/index.php/Kernel_modules#Loading

  ## Microcode TODO
  # https://wiki.archlinux.org/index.php/Microcode

  ## Retaining boot messages TODO
  # https://wiki.archlinux.org/index.php/Disable_clearing_of_boot_messages

  ## Num Lock activation TODO
  # 2https://wiki.archlinux.org/index.php/Activating_Numlock_on_Bootup
  yaourt -S --needed --noconfirm numlockx

# Graphical user interface

  ## Display drivers
  # Intel
  yaourt -S --needed --noconfirm xf86-video-intel
  # Nvidia
  yaourt -S --needed --noconfirm nvidia
  # https://wiki.archlinux.org/index.php/Bumblebee#Bumblebee:_Optimus_for_Linux
  # Bumblebee
  yaourt -S --needed --noconfirm mesa mesa-demos
  yaourt -S --needed --noconfirm bumblebee bbswitch primus virtualgl
  yaourt -S --needed --noconfirm lib32-nvidia-utils lib32-mesa-libgl lib32-mesa
  yaourt -S --needed --noconfirm lib32-primus lib32-virtualgl
  gpasswd -a acgtyrant bumblebee
  systemctl enable bumblebeed.service
  systemctl start bumblebeed.service

  ## Display server TODO
  # https://wiki.archlinux.org/index.php/Xorg
  # https://wiki.archlinux.org/index.php/Wayland
  yaourt -S --noconfirm --needed xorg-server xorg-xmodmap
  yaourt -S --noconfirm --needed compton
  yaourt -S --noconfirm --needed lxrandr

  ## Windows managers
  yaourt -S --noconfirm --needed i3 conky
  # https://wiki.archlinux.org/index.php/I3#Correct_handling_of_floating_dialogs
  yaourt -S --noconfirm --needed xorg-xprop

  ## Display manager
  yaourt -S --noconfirm --needed xorg-xinit

  ## Desktop environments

# Power management TODO
# https://wiki.archlinux.org/index.php/Power_management

  ## ACPI events TODO
  # https://wiki.archlinux.org/index.php/Power_management#Power_management_with_systemd
  # https://wiki.archlinux.org/index.php/Acpid
  yaourt -S --noconfirm --needed acpi

  ## CPU frequency scaling TODO
  # https://wiki.archlinux.org/index.php/CPU_frequency_scaling

  ## Laptops TODO
  # https://wiki.archlinux.org/index.php/Laptop

  ## Suspend and Hibernate TODO
  # https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate

# Multimedia

  ## Sound
  yaourt -S --noconfirm --needed alsa-utils pulseaudio paprefs pavucontrol \
      pulseaudio-alsa

  ## Browser plugins TODO
  # https://wiki.archlinux.org/index.php/Browser_plugins

  ## Codecs TODO
  # https://wiki.archlinux.org/index.php/Codecs

# Networking TODO
# https://wiki.archlinux.org/index.php/Network_configuration
yaourt -S --noconfirm --needed gnome-nettols
yaourt -S --noconfirm --needed dnsutils
yaourt -S --noconfirm --needed net-tools

  ## Clock synchronization TODO
  # https://wiki.archlinux.org/index.php/Time#Time_synchronization

  ## DNS security TODO
  # https://wiki.archlinux.org/index.php/DNSCrypt

  ## Setting up a firewall TODO
  # https://wiki.archlinux.org/index.php/Iptables
  # https://wiki.archlinux.org/index.php/Firewalls

  ## Resource sharing TODO
  # https://wiki.archlinux.org/index.php/NFS
  # https://wiki.archlinux.org/index.php/Sshfs

# Input devices

  ## Keyboard layouts
  ## Mouse buttons TODO
  # https://wiki.archlinux.org/index.php/All_Mouse_Buttons_Working
  ## Laptop touchpads TODO
  # https://wiki.archlinux.org/index.php/Touchpad_Synaptics
  yaourt -S --noconfirm --needed xf86-input-synaptics
  ## TrackPoints TODO
  # https://wiki.archlinux.org/index.php/TrackPoint

# Optimization

  ## Benchmarking TODO
  # https://wiki.archlinux.org/index.php/Benchmarking
  ## Maximizing performance  TODO
  # https://wiki.archlinux.org/index.php/Maximizing_performance
  ## Solid state drives TODO
  # https://wiki.archlinux.org/index.php/Solid_State_Drives

# System service

  ## File index and search
  yaourt -S mlocate
  ## Local mail delivery
  ## Printing TODO
  # https://wiki.archlinux.org/index.php/CUPS

# Appearance

  ## Fonts
  echo "Installing fonts..."
  yaourt -S --noconfirm --needed wqy-zenhei wqy-microhei otf-hermit \
      adobe-source-han-sans-cn-fonts ttf-ubuntu-font-family
  sleep 1; echo "Done."

  ## GTK and Qt themes
  yaourt -S --noconfirm --needed paper-gtk-theme-git deepin-gtk-theme deepin-icon-theme
  yaourt -S --noconfirm --needed lxappearance

# Console improvements

  ## Alternative shells
  yaourt -S --noconfirm --needed zsh
  chsh -s /bin/zsh acgtyrant
  # oh-my-zsh TODO

  ## Compressed files
  yaourt -S --noconfirm --needed unzip zip p7zip unrar file-roller

  ## Scrollback buffer TODO

  ## Session management
  yaourt -S --noconfirm --needed tmux
