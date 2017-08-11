git clone --depth 1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
rm ~/.bashrc
stow Shell

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
stow Vim

stow commands Fonts Git Locale Python Ranger SSH Tmux
