# Applications

yaourt -S --noconfirm --needed pkgstats

# Game
yaourt -S --noconfirm --needed steam

# Internet

  ## Network Managers
  ## Web browsers
  yaourt -S --noconfirm --needed google-chrome chromium-pepper-flash firefox opera
  ## Downloaders
    ### BitTorrent clients
    yaourt -S --noconfirm --needed deluge
    ### eDonkey clients
    yaourt -S --noconfirm --needed amule
    ### Video downloaders
    yaourt -S --noconfirm --needed you-get
  ## Communication
    ### Email clients
    yaourt -S --noconfirm --needed thunderbird
    ### Instant messaging
      #### IRC clients
      yaourt -S --noconfirm --needed hexchat
    ### News, RSS, and blogs
      #### Blog software
      yaourt -S --noconfirm --needed nodejs-hexo #TODO
      #### Microblogging clients TODO
  #yaourt -S --noconfirm --needed rainbowstream
  ## Pastebin TODO
  yaourt -S --noconfirm --needed wgetpaste

# Multimedia TODO

  ## Image
    ### Image viewers
    yaourt -S --noconfirm --needed feh 
  ## Graphics and image manipulation
    ### Raster editors TODO
  ## Screen capture TODO
    scrot
  ## Audio
    ### Audio players TODO
    yaourt -S --noconfirm --needed deadbeef
  ## Video
    ### Video players TODO
    yaourt -S --noconfirm --needed mplayer gnome-mplayer vlc
    ### Subtitles TODO
    yaourt -S --noconfirm --needed aegisub 

# Utilities

  ## Partitioning tools
  gparted
  ## Mount tools
  ## Terminal emulators
    termite
  ## Files
    ### File managers
    ranger nautilus gvfs-smb
  ## Desktop search engines
  catfish
  ## Archiving and compression tools
  p7zip tar ### Graphical TODO
  ## Comparison, diff, merge
  meld
  ## Disk cleaning TODO
  bleachbit
  ## Disk usage display
  baobab
  ## Clock synchronization TODO
  ## System monitoring
  conky gnome-system-monitor htop
  ## System information viewers
  alsi gpu-g-bzr hardinfo
  ## Power management see general.sh
  ## Clipboard managers TODO
  xclip
  ## Wallpaper setters TODO
  feh
  ## Package management see general.sh
  ## Input method editor
  fcitx-im fcitx-rime fcitx-im fcitx-configtool fcitx-qt5
  ## File synchronization
  rsync

# Documents

## Office suites
wps-office
## Document markup languages
markdown pandoc python-sphinx
## Scientific documents
texmate
## Translation and localization TODO
## Text editors
vim gvim neovim gedit emacs
## Readers and Viewers
### PDF and DjVu
evince
### Terminal pagers
less vimpager
### CHM
### Comic book
mcomix
### Scanning software TODO
### OCR software TODO
## Mind-mapping tools
xmind
## Character Selector TODO
## Bibliographic reference managers TODO

# Security

  ## Firewalls see gneneral.sh
  ## Network security TODO
  ## Threat and vulnerability detection TODO
  ## File security TODO
  ## Anti malware TODO
  ## Backup programs see general.sh
  ## Screen lockers TODO
  xautolocki3lock
  ## Hash checkers
  gtkhash gtkhash-nautilus
  ## Encryption, signing, steganography TODO
  ## Password managers TODO

# Science

## Mathematics
### Calculator
gnome-calculator
### Scientific or technical computing TODO

# Other

## Work environment
### Bootsplash TODO
### Command shells see general.sh
### Terminal multiplexers see general.sh
### Window managers see general.sh
## Application launchers TODO
dmenu synapse
## Emulators TODO

## Proxy TODO
yaourt -S --noconfirm --needed shadowsocks python2-m2crypto cow-proxy

## Photoshop
yaourt -S --noconfirm --needed gimp

## Git
yaourt -S --noconfirm --needed git tig
mkdir ~/.ssh
ssh-keygen -t rsa -b 4096 -C "acgtyrant@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
# add your key to git server!

## Cloud backup TODO
yaourt -S --noconfirm --needed nutstore nautilus-nutstore

## Remote desktop
yaourt -S --noconfirm --needed teamviewer

## Safe plusgins
yaourt -S --noconfirm --needed upeditor

## Calender
#starcal2

## Others
yaourt -S --noconfirm --needed cmatrix \
  weatherboy whois create_ap openssh linux-headers rescuetime \
  autojump tree

# Preference
#git clone git@github.com:robbyrussell/oh-my-zsh.git /home/acgtyrant/.oh-my-zsh
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# vim +PluginInstall +qall
# cd~; take ycm_build;
# cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON -DUSE_SYSTEM_BOOST=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
# cmake --build . --target ycm_support_libs --config Release
yaourt -S --noconfirm --needed stow
#stow

# Development
yarout -S --noconfirm --needed git gitg hub rust python clang cmake gdb \
  valgrind nodejs dnsutils ctags gist npm strace lsof cpplint cloc boost \
  boost-libs opencv ack fdupes the_silver_searcher perf search-and-view-git
