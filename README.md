dotfiles
========

Editor and shell settings inspired by http://dotfiles.github.io/

Install via:

    find ~/dotfiles -type f -name '\.*' -maxdepth 1 -print  | grep -v "~" | xargs -I {} echo ln -s {} $HOME/`basename $HOME/{}`

MacOS
-----

Homebrew packages:

    brew install cmake rectangle tmux emacs fzf nodenv rbenv pyenv jq editorconfig

Homebrew packages to build GDAL from source:

	brew install json-c libspatialite libxml2 proj@7 geos ninja openjpeg libkml libpq
	brew link boost
	brew link --force libpq

Python packages:

    env MACOSX_DEPLOYMENT_TARGET=12.0 pyenv install 3.10.6
    pip install -U pip virtualenv awscliv2 gimme-aws-creds ipython ipdb numpy jedi
