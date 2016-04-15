# Applications
# https://wiki.archlinux.org/index.php/List_of_applications

# Game
yaourt -S --noconfirm --needed steam

# Internet

  ## Network Managers
  yaourt -S --noconfirm --needed networkmanager network-manager-applet
  yaourt -S --noconfirm --needed gnome-keyring libgnome-keyring
  systemctl enable networkmanager
  systemctl start networkmanager
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
    yaourt -S --noconfirm --needed feh jpeginfo
  ## Graphics and image manipulation
    ### Raster editors TODO
  ## Screen capture TODO
    yaourt -S --noconfirm --needed maim slop deepin-screenshot
  ## Audio
    ### Audio players TODO
    yaourt -S --noconfirm --needed deadbeef
  ## Video
    ### Video players TODO
    yaourt -S --noconfirm --needed mpv gnome-mpv vlc mediainfo
    ### Subtitles TODO
    yaourt -S --noconfirm --needed aegisub

# Utilities

  ## Partitioning tools
  yaourt -S --noconfirm --needed gparted
  ## Mount tools
  ## Terminal emulators
    yaourt -S --noconfirm --needed termite
  ## Files
    ### File managers
    # https://wiki.archlinux.org/index.php/File_manager_functionality#Thumbnail_previews
    yaourt -S --noconfirm --needed ranger nautilus gvfs-smb gvfs-mtp \
        thumbler poppler-glib ffmepgthumbnailer freetype2 libgsf raw-thumbnailer totem
  ## Desktop search engines
  yaourt -S --noconfirm --needed catfish
  ## Archiving and compression tools
  yaourt -S --noconfirm --needed p7zip tar ### Graphical TODO
  ## Comparison, diff, merge
  yaourt -S --noconfirm --needed meld
  ## Disk cleaning TODO
  yaourt -S --noconfirm --needed bleachbit
  ## Disk usage display
  yaourt -S --noconfirm --needed baobab
  ## Clock synchronization TODO
  ## System monitoring
  yaourt -S --noconfirm --needed conky gnome-system-monitor htop
  ## System information viewers
  yaourt -S --noconfirm --needed alsi cpu-g-bzr hardinfo lsb-release
  ## Power management see general.sh
  ## Clipboard managers TODO
  yaourt -S --noconfirm --needed xclip
  ## Wallpaper setters TODO
  yaourt -S --noconfirm --needed feh
  ## Package management see general.sh
  ## Input method editor
  yaourt -S --noconfirm --needed fcitx-im fcitx-rime fcitx-im fcitx-configtool fcitx-qt5
  ## File synchronization
  yaourt -S --noconfirm --needed rsync

# Documents

  ## Office suites
  yaourt -S --noconfirm --needed wps-office
  ## Document markup languages
  yaourt -S --noconfirm --needed markdown pandoc python-sphinx
  ## Scientific documents
  yaourt -S --noconfirm --needed texmate
  ## Translation and localization TODO
  ## Text editors
  yaourt -S --noconfirm --needed gvim gedit emacs
  yaourt -S --noconfirm --needed neovim python-neovim python2-neovim 
  ## Readers and Viewers
    ### PDF and DjVu
    yaourt -S --noconfirm --needed evince
    ### Terminal pagers
    yaourt -S --noconfirm --needed less vimpager
    ### CHM
    ### Comic book
    yaourt -S --noconfirm --needed mcomix
    ### Scanning software TODO
    ### OCR software TODO
  ## Mind-mapping tools
  yaourt -S --noconfirm --needed xmind
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
  yaourt -S --noconfirm --needed xautolock i3lock
  ## Hash checkers
  yaourt -S --noconfirm --needed gtkhash gtkhash-nautilus
  ## Encryption, signing, steganography TODO
  ## Password managers TODO

# Science

  ## Mathematics
    ### Calculator
    yaourt -S --noconfirm --needed gnome-calculator
    ### Scientific or technical computing TODO

# Other

  ## Work environment
    ### Bootsplash TODO
    ### Command shells see general.sh
    ### Terminal multiplexers see general.sh
    ### Window managers see general.sh
  ## Application launchers TODO
  yaourt -S --noconfirm --needed dmenu synapse
  ## Emulators TODO

################################################################################

## Proxy TODO
yaourt -S --noconfirm --needed shadowsocks python2-m2crypto cow-proxy

## Cloud backup TODO
yaourt -S --noconfirm --needed nutstore nautilus-nutstore

## Remote desktop
yaourt -S --noconfirm --needed teamviewer

## Safe plugins
yaourt -S --noconfirm --needed upeditor	aliedit

## Others
yaourt -S --noconfirm --needed cmatrix weatherboy whois create_ap openssh \
    linux-headers rescuetime autojump tree

# Development

  ## VCS
  yaourt -S --noconfirm --needed git gitg tig hub
  mkdir ~/.ssh
  ssh-keygen -t rsa -b 4096 -C "acgtyrant@gmail.com"
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
  echo "add your key to git server!"
  ## python
  yaourt -S --noconfirm --needed python ipython
  yaourt -S --noconfirm --needed flake8 python2-flake8
  yaourt -S --noconfirm --needed ipython jupyter
  # http://blog.csdn.net/gaoyingju/article/details/50449522#0-tsina-1-61768-397232819ff9a47a7b7e80a40613cfe1
  pip install pep8-naming flake8-import-order flake8-todo flake8-quotes 
  ## rust
  yaourt -S --noconfirm --needed rust
  ## C/C++
  yaourt -S --noconfirm --needed gdb cmake clang valgrind ctags cpplint
  yaourt -S --noconfirm --needed opencv boost boost-libs
  yaourt -S --noconfirm --needed gperftools
  ## system profiler
  yaourt -S --noconfirm --needed strace lsof perf
  ## nodjes
  yaourt -S --noconfirm --needed nodejs npm
  ## Machine Learning
  yaourt -S --noconfirm --needed boost google-glog hdf5 leveldb lmdb protobuf \
      snappy gflags
  ### Caffe
  yaourt -s --noconfirm --needed cython python-numpy python-scipy \
      python-matplotlib python-scikit-image python-h5py python-plyvel \
      python-networkx python-nose python-pandas python-dateutil python-gflags \
      python-yaml python-six python-pillow python-protobuf
  ## Others
  yaourt -S --noconfirm --needed cloc ack fdupes the_silver_searcher \
      search-and-view-git stow python-powerline python2-powerline nyancat \
      enca dos2unix unix2dox renameutils
