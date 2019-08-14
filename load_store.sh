#!/bin/bash

# Create the correct structure on user files.
mkdir -p .config

mkdir -p .emacs.d/

# Copy the configuration files.

# Copy the i3 configuration files.
cp -rf .config/i3/ ~/.config/
cp -rf .config/i3status ~/.config/

# Copy the EMACS configuration files.
cp .emacs.d/init.el ~/.emacs.d/init.el
cp .emacs.d/config.org ~/.emacs.d/config.org
cp -r .emacs.d/scripts/ ~/.emacs.d/

# Copy the .Xresources configuration files.
cp .Xresources ~/.Xresources
