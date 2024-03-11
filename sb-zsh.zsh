#!/bin/zsh

# Description: This script sources all the .zsh files in the specified directory.
# Usage: Add this to your .zshrc file: source "$HOME/.sb-zsh/sb-zsh.zsh"
# Parameters: None

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
