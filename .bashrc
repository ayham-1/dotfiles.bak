#
# /etc/bash.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

(cat ~/.cache/wal/sequences &)
. ~/.cache/wal/colors.sh

PS1='[\u@\h \W]\$ '

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

#export PS1="\[\033[38;5;6m\][\[$(tput sgr0)\]\[\033[38;5;83m\]\u\[$(tput sgr0)\]\[\033[38;5;77m\]@\[$(tput sgr0)\]\[\033[38;5;112m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;42m\]\W\[$(tput sgr0)\]\[\033[38;5;6m\]]\[$(tput sgr0)\]\[\033[38;5;81m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
export PS1="[\W] \\$ "
set -o vi

source ~/.config/env
source "/home/dizzy/.local/share/cargo/env"
