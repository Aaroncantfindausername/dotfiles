#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto -i'
alias tenable='hyprctl keyword "device[asuf1416:00-2808:0108-touchpad]:enabled" true'
alias tdisable='hyprctl keyword "device[asuf1416:00-2808:0108-touchpad]:enabled" false'
alias cdd='cd ~/Files/Uni/Courses/'
alias 60_rrate='hyprctl keyword monitor ,2560x1600@60,auto,1.666'
alias 240_rrate='hyprctl keyword monitor ,2560x1600@240,auto,1.666'
alias open='xdg-open'
if [[ ${EUID} == 0 ]]; then
  PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
  PS1='\[\033[01;32m\]\u\[\033[01;34m\] \w \$\[\033[00m\] '
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# binds

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/aaronz/anaconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ 1 -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "/home/aaronz/anaconda3/etc/profile.d/conda.sh" ]; then
    . "/home/aaronz/anaconda3/etc/profile.d/conda.sh"
  else
    export PATH="/home/aaronz/anaconda3/bin:$PATH"
  fi
fi
unset __conda_setup

# <<< conda initialize <<<

. "$HOME/.cargo/env"

# Fzf
eval "$(fzf --bash)"
eval "$(ssh-agent -s)" >/dev/null

# Created by `pipx` on 2025-10-14 10:35:21
export PATH="$PATH:/home/aaronz/.local/bin"
eval "$(zoxide init --cmd cd bash)"

# yazi shell wrapper
function y() {
  local tmp cwd
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
  command rm -f -- "$tmp"
}
