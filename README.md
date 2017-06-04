dotfiles
========

I am [Using GNU Stow to manage my dotfiles](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html), I arrange my all dotfiles here, and there are many comments and references to ArchWiki inside them, which are very helpful.

Let me explain some diretories.

## Compton

The default config is enough. unless you want to disable shadowing of some windows.

## Default Applications

I follow [Desktop entries](https://wiki.archlinux.org/index.php/Desktop_entries) to set my [Default applications](https://wiki.archlinux.org/index.php/Default_applications#MIME_types_and_desktop_entries), and I do not use any DE, so there are only a `$HOME/.config/mimeapps.list` inside, at the same time, I set some environments to appoint default applications in the Shell sections.

## Git

I use tig as the pager for git, and set some aliases.

I use meld as the differ for git.

No `.gitignore`, I advise that set `.gitgnore` for every program by yourself, just pull `github/gitignore` immediately.

## X11

.config/gtk-3.0/bookmarks: use for Nautilus.
.config/gtk-3.0/setting.ini: GTK+ 3 config.
.config/.gtkrc-2.0: GTK+ 2 config.
.xinitrc & .Xmodmap: X11 config.

By the way, I write some scripts to reinstall Arch Linux quickly, but they are not practical as so far.
