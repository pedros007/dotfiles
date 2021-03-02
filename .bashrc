# -*- mode: sh -*-

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# standard Linuxy things that I like
export EDITOR="emacs"
export PS1="[\[\e[1;34m\]\u\[\033[0m\]@\[\e[0;33m\]\h\[\033[0m\]] \[\e[1;31m\]\[\033[0m\]\w$ "
export LS_COLORS="no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;00:cd=40;33;00:or=00;05;37;41:mi=00;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:"

# Work-related dotfiles that I might not want on github.
if [ -f ~/.dg ]; then
	. ~/.dg
fi

if [ -f ~/.randonnee ]; then
	. ~/.randonnee
fi

# Notes & miscellaneous helpful things.

# disable stupid thing that makes C-s horrendously awkward in Konsole.
# http://unix.stackexchange.com/questions/12107/how-to-unfreeze-after-accidentally-pressing-ctrl-s-in-a-terminal
# With this uncomented, login shells will print out "stty: standard input: Invalid argument", which we dont want.  
# Find more here: http://capistranorb.com/documentation/faq/why-does-something-work-in-my-ssh-session-but-not-in-capistrano/
#stty -ixon

# create patch between directories or files a,b:
# diff -Naur a b

#vncserver :1 -geometry 1680x1050
#xrandr -s 1680x1050
#   \\===> see http://www.linuxquestions.org/questions/fedora-35/vncserver-not-using-geometry-setting-in-command-4175444307/

export TERM=xterm-256color
export GOPATH=$HOME/src/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=/Users/pschmitt/opt/gdal/bin:$PATH
