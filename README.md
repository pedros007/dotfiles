dotfiles
========

Editor and shell settings inspired by http://dotfiles.github.io/

Install via:

    find ~/dotfiles -type f -name '\.*' -maxdepth 1 -print  | grep -v "~" | xargs -I {} echo ln -s {} $HOME/`basename $HOME/{}`
