#!/bin/bash

# Install git.
sudo apt install git -y

# Install packages from package_list.txt
cat install_scripts/ubuntu/19/package_list.txt | xargs sudo apt install -y

# Install Oh-my-zsh for ZSH shell environment.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Vundle for Vim plugin managment.
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Build packages from source (for packages not found on stock apt sources.list).

# Setup build environment.
mkdir -p build

# Build Light Package for backlight managment
git clone https://github.com/haikarainen/light.git build/light/
cd build/light
./autogen.sh
./configure && make
sudo make install
sudo chmod u+s /usr/local/bin/light

# Clean build environment.
rm -rf build

# Post package configuration.

# Initialize Vim plugins.
vim +PluginInstall +qall
