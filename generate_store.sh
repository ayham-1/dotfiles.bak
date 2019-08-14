#!/bin/bash

# Clear the store first
./clean_store.sh

# Build the directory structure
mkdir -p .config/

mkdir -p .emacs.d/

# Make sure that the directories are there.
mkdir -p ~/.config

mkdir -p ~/.emacs.d/

# Copy configuration files.

# Copy i3 configuration files.
cp -rf ~/.config/i3/ .config/
cp -rf ~/.config/i3status/ .config/

# Copy EMACS configuration files.
cp ~/.emacs.d/init.el .emacs.d/
cp ~/.emacs.d/config.org .emacs.d/
cp -rf ~/.emacs.d/scripts/ .emacs.d/

# Copy .Xresources configuration.
cp ~/.Xresources .Xresources

# Copy vim configuration.
cp ~/.vimrc .vimrc

# TODO: Add Auto requirements installation script.
