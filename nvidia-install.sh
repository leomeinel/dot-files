#!/bin/sh

nvidia-settings -r
echo "nvidia-settings -l &" > ~/.xprofile
rm -rf ~/nvidia-install.sh
