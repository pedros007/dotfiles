dotfiles
========

Editor and shell settings inspired by http://dotfiles.github.io/

Install via:

    for df in $HOME/dotfiles/.[a-zA-Z0-9]*; do ln -s $df $HOME/`basename $HOME/$df`; done
