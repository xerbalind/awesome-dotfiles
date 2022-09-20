#!/usr/bin/env bash

# Current script directory
CDIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Clone my fork of awesome widgets
rm $CDIR/.config/awesome/awesome-wm-widgets -Rf
git clone https://github.com/xerbalind/awesome-wm-widgets.git $CDIR/.config/awesome/awesome-wm-widgets


mkdir $HOME/.config/ -p
stow . --dir=$CDIR --ignore 'LICENSE|.*\.me|setup.sh' --target $HOME

