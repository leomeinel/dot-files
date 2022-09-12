#!/bin/sh

# Copy dot-files
cp -R ~/dot-files/.bashrc ~/dot-files/.bashrc_aliases ~/dot-files/.bash_profile ~/dot-files/.bash_logout ~/dot-files/.gitconfig ~/dot-files/.config ~/
chmod 744 ~/.bashrc_aliases

# Create .ssh
mkdir ~/.ssh
chmod 700 ~/.ssh

# Create src
mkdir ~/src
chmod 700 ~/src

# Set default rust
rustup default stable

# Install vscodium extensions
vscodium --list-extensions | xargs -n 1 vscodium --uninstall-extension --force
xargs -n 1 vscodium --install-extension < ~/dot-files/vscodium-extensions.txt

# Initialize nvim
nvim --headless -c 'sleep 10' -c 'q!'

# Remove repo
rm -rf ~/dot-files
