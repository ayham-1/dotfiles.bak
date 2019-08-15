#!/bin/bash

# Check for host distro and version.
if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$ID
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
    # Older SuSE/etc.
    OS=SuSE
    VER=$(cat /etc/SuSe-release)
elif [ -f /etc/redhat-release ]; then
    # Older Red Hat, CentOS, etc.
    OS=RedHat
    VER=$(cat /etc/redhat-release)
else
    # Distro not supported or not recognized.
    # TODO: Refrence script help.
    echo 'Distro is not recognized.'
    # TODO: Maybe ask the user for the distro and version?
    exit
fi

# Standarize naming.
_OS="$(echo $OS | tr '[:upper:]' '[:lower:]')" # Upper -> Lower
_VER="$(echo $VER | tr '[:upper:]' '[:lower:]')" # Upper -> Lower
_VER=${_VER/.*} # decimal -> int
unset OS
unset VER

# Execute installation packages.

# Arch, Gentoo linux is a rolling distro.
if [ _OS = arch ] || [ _OS = gentoo ]; then 
   ./install_scripts/$_OS/install_packages.sh
else
    # For other distors this should work.
    ./install_scripts/$_OS/$_VER/install_packages.sh
fi
