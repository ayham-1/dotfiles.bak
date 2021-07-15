#!/bin/sh

[[ -f ~/.config/env ]] && source ~/.config/env

#if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec sx sh ~/.config/X11/dwm-xinit; fi
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx ~/.config/X11/dwm-xinit; fi
