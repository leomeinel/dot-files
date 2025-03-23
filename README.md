# dot-files

Configuration files and miscellaneous files for my personal linux setups.

Meant for general purpose systems with a GUI.

## Requirements

There might be other packages that are needed for scripts and configs to function.

### Arch repo

- [alacritty](https://archlinux.org/packages/extra/x86_64/alacritty/)
- [apparmor](https://archlinux.org/packages/extra/x86_64/apparmor/)
- [flatpak](https://archlinux.org/packages/extra/x86_64/flatpak/)
- [git-delta](https://archlinux.org/packages/extra/x86_64/git-delta/)
- [git](https://archlinux.org/packages/extra/x86_64/git/)
- [gnome-keyring](https://archlinux.org/packages/extra/x86_64/gnome-keyring/)
- [gnupg](https://archlinux.org/packages/core/x86_64/gnupg/)
- [gsettings](https://archlinux.org/packages/extra/any/gsettings-desktop-schemas/)
- [libsecret](https://archlinux.org/packages/core/x86_64/libsecret/)
- [nwg-bar](https://archlinux.org/packages/extra/x86_64/nwg-bar/)
- [pipewire-pulse](https://archlinux.org/packages/extra/x86_64/pipewire-pulse/)
- [polkit-gnome](https://archlinux.org/packages/extra/x86_64/polkit-gnome/)
- [sway](https://archlinux.org/packages/extra/x86_64/sway/)
- [swaybg](https://archlinux.org/packages/extra/x86_64/swaybg/)
- [swayidle](https://archlinux.org/packages/?name=swayidle)
- [swaylock](https://archlinux.org/packages/extra/x86_64/swaylock/)
- [swaync](https://archlinux.org/packages/extra/x86_64/swaync/)
- [systemd](https://archlinux.org/packages/core/x86_64/systemd/)
- [waybar](https://archlinux.org/packages/extra/x86_64/waybar/)
- [wofi](https://archlinux.org/packages/extra/x86_64/wofi/)
- [xdg-desktop-portal](https://archlinux.org/packages/extra/x86_64/xdg-desktop-portal/)
- [xdg-user-dirs](https://archlinux.org/packages/extra/x86_64/xdg-user-dirs/)
- [xorg-xwayland](https://archlinux.org/packages/extra/x86_64/xorg-xwayland/)

### AUR

- [kvantum-theme-arc](https://aur.archlinux.org/packages/kvantum-theme-arc)

### Flatpak

Executables should be stored in /usr/local/bin

- [librewolf](https://flathub.org/apps/io.gitlab.librewolf-community)
- [pwvucontrol](https://flathub.org/apps/com.saivert.pwvucontrol)

### Custom

- nix

```sh
# Execute as root
sh <(curl -L https://nixos.org/nix/install) --daemon --yes --nix-extra-conf-file ~/.config/dot-files/nix.conf
```

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
