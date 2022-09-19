#!/usr/bin/env bash

# Clone my fork of awesome widgets
rm .config/awesome/awesome-wm-widgets -Rf
git clone https://github.com/xerbalind/awesome-wm-widgets.git .config/awesome/awesome-wm-widgets

stow . --ignore 'LICENSE|.*\.me|setup.sh' --target $HOME

