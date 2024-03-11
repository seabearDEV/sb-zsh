#!/bin/zsh

# Description: This script installs sb-zsh scripts to the user's home directory.
# Usage: Run the script and follow the prompts to install sb-zsh scripts.
# Parameters: None

# Function to install sb-zsh scripts
install_sb_zsh() {
  local INSTALL_DIR="$HOME/.sb-zsh"

  # Check if the directory exists, remove it if it does
  if [[ -d "$INSTALL_DIR" ]]; then
    echo "The directory already exists, deleting it..."
    rm -rf "$INSTALL_DIR"
  fi

  # Create the directory
  echo "Creating directory '$INSTALL_DIR'..."
  mkdir "$INSTALL_DIR"

  # Copy the scripts to the directory
  echo "Installing scripts to $INSTALL_DIR..."
  cp ./sb-zsh.zsh "$INSTALL_DIR"
  cp -r ./scripts* "$INSTALL_DIR"

  # Source the .zshrc file
  echo "Scripts installed successfully, sourcing the .zshrc file..."
  source "$HOME/.zshrc"

  echo "Sourcing complete, please be sure to add the following line to your .zshrc file:"
  echo 'source "$HOME/.sb-zsh/sb-zsh.zsh"'
}

# Prompt the user for confirmation
echo "Install sb-zsh scripts to '$HOME/.sb-zsh'? (y/n)"
read response

# Check the user's response and install if confirmed
if [[ "$response" == "y" ]]; then
  install_sb_zsh
else
  echo "Installation cancelled."
fi
