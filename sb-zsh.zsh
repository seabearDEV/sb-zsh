#!/bin/zsh

for script in "$HOME/.sb-zsh/scripts/"*.zsh; do
  if [[ -f "$script" ]]; then
    source "$script"
  fi
done