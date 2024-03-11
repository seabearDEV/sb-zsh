#!/bin/zsh

echo "Install sb-zsh scripts to '$HOME/.sb-zsh'? (y/n)"
read response

if [[ "$response" == "y" ]]; then
  if [[ ! -d "$HOME/.sb-zsh" ]]; then
    echo "Directory does not exist. Creating it..."
    mkdir "$HOME/.sb-zsh"
  else
    echo "The directory already exists, deleting and recreating it..."
    rm -rf "$HOME/.sb-zsh"
    mkdir "$HOME/.sb-zsh"
  fi

  echo "Installing scripts to $HOME/.sb-zsh..."
  cp ./sb-zsh.zsh "$HOME/.sb-zsh"
  cp -r ./scripts* "$HOME/.sb-zsh"

  echo "Scripts installed successfully, sourcing the .zshrc file..."
  source "$HOME/.zshrc"

  echo "Sourcing complete."
else
  echo "Installation cancelled."
fi