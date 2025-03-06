# dot-files

Configuration files and miscellaneous files for my personal linux setups

## Installation

Edit `install.conf` to specify the usernames matching your system. If any of the users are not needed by you, you can just leave them how they are.

```sh
git clone https://github.com/leomeinel/dot-files.git ~/.config/dot-files
chmod +x ~/.config/dot-files/setup.sh
~/.config/dot-files/setup.sh $USER
```

## Updating

```sh
git clone https://github.com/leomeinel/dot-files.git ~/.config/dot-files
chmod +x ~/.config/dot-files/update.sh
~/.config/dot-files/update.sh $USER
```
