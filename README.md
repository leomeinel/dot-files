# dot-files

Configuration files and miscellaneous files for my personal linux setups.

Meant for general purpose systems with a GUI.

## Installation

Edit `install.conf` to specify the usernames matching your system. If any of the users are not needed by you, you can just leave them how they are.

```sh
# Instead of main, you can also use a tag.
git clone -b main https://github.com/leomeinel/dot-files.git ~/.config/dot-files
chmod +x ~/.config/dot-files/setup.sh
~/.config/dot-files/setup.sh
```

## Updating

```sh
chmod +x ~/.config/dot-files/update.sh
~/.config/dot-files/update.sh
```
