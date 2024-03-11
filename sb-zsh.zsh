#!/bin/zsh
# File: load_scripts.zsh
# Description: This script loads all the .zsh files in the $HOME/.sb-zsh/scripts/ directory.

# Define the directory where the scripts are located
scripts_dir="$HOME/.sb-zsh/scripts"

# Loop through all the .zsh files in the scripts directory
for script in "$scripts_dir/"*.zsh; do
  # Check if the file exists and is a regular file
  if [[ -f "$script" ]]; then
    # Source the script file
    source "$script"
  fi
done