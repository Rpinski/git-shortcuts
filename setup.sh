#!/usr/bin/env bash

echo "Adding Git Shortcuts to global Git configuration..."
git config --global --add include.path "$(pwd)/git-shortcuts.gitconfig"

echo
read -p "Would you like to add some settings to improve Git experience? (y|n)" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Applying additional Git settings..."
    git config --global --add include.path "$(pwd)/git-goodies.gitconfig"

    echo "Following settings have been applied:"
    echo
    cat $(pwd)/git-goodies.gitconfig
fi

echo
echo "Thank you and have fun with Git!"