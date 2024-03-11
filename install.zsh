#!/bin/zsh

# Function to install sb-zsh scripts
install_sb_zsh() {
  local install_dir="$HOME/.sb-zsh"

  # Check if the directory exists, remove it if it does
  if [[ -d "$install_dir" ]]; then
    echo "The directory already exists, deleting it..."
    rm -rf "$install_dir"
  fi

  # Create the directory
  echo "Creating directory '$install_dir'..."
  mkdir "$install_dir"

  # Copy the scripts to the directory
  echo "Installing scripts to $install_dir..."
  cp ./sb-zsh.zsh "$install_dir"
  cp -r ./scripts* "$install_dir"

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