#!/bin/zsh

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

  echo "Sourcing complete."
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
