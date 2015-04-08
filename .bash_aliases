# -*- mode: sh -*-

if [[ `uname` == 'Darwin' ]]; then
    # OSX
    alias ls="ls -G"
else
    # Linux
    alias ls="ls --color=auto"
fi
alias l="ls -lhF"
alias emacs='emacsclient -a "" -nw'
alias em="emacs"
alias grep="grep --color"
alias egrep="egrep --color"
