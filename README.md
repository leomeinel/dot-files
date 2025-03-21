# dot-files

Configuration files and miscellaneous files for my personal linux setups.

Meant for general purpose systems with a GUI.

## Requirements

There might be other packages that are needed for scripts and configs to function.

### Arch repo

- [alacritty](https://archlinux.org/packages/extra/x86_64/alacritty/)
- [apparmor](https://archlinux.org/packages/extra/x86_64/apparmor/)
- [autotiling](https://archlinux.org/packages/extra/any/autotiling/)
- [bat](https://archlinux.org/packages/extra/x86_64/bat/)
- [blueman](https://archlinux.org/packages/extra/x86_64/blueman/)
- [brightnessctl](https://archlinux.org/packages/extra/x86_64/brightnessctl/)
- [evince](https://archlinux.org/packages/extra/x86_64/evince/)
- [git](https://archlinux.org/packages/extra/x86_64/git/)
- [gnome-keyring](https://archlinux.org/packages/extra/x86_64/gnome-keyring/)
- [gnupg](https://archlinux.org/packages/core/x86_64/gnupg/)
- [gsettings](https://archlinux.org/packages/extra/any/gsettings-desktop-schemas/)
- [kanshi](https://archlinux.org/packages/extra/x86_64/kanshi/)
- [libsecret](https://archlinux.org/packages/core/x86_64/libsecret/)
- [network-manager-applet](https://archlinux.org/packages/extra/x86_64/network-manager-applet/)
- [nextcloud-client](https://archlinux.org/packages/extra/x86_64/nextcloud-client/)
- [nwg-bar](https://archlinux.org/packages/extra/x86_64/nwg-bar/)
- [pipewire-pulse](https://archlinux.org/packages/extra/x86_64/pipewire-pulse/)
- [polkit-gnome](https://archlinux.org/packages/extra/x86_64/polkit-gnome/)
- [rustup](https://archlinux.org/packages/extra/x86_64/rustup/)
- [slurp](https://archlinux.org/packages/extra/x86_64/slurp/)
- [sway](https://archlinux.org/packages/extra/x86_64/sway/)
- [swaybg](https://archlinux.org/packages/extra/x86_64/swaybg/)
- [swaylock](https://archlinux.org/packages/extra/x86_64/swaylock/)
- [swaync](https://archlinux.org/packages/extra/x86_64/swaync/)
- [swayidle](https://archlinux.org/packages/?name=swayidle)
- [systemd](https://archlinux.org/packages/core/x86_64/systemd/)
- [waybar](https://archlinux.org/packages/extra/x86_64/waybar/)
- [wofi](https://archlinux.org/packages/extra/x86_64/wofi/)
- [xdg-desktop-portal](https://archlinux.org/packages/extra/x86_64/xdg-desktop-portal/)
- [xdg-user-dirs](https://archlinux.org/packages/extra/x86_64/xdg-user-dirs/)
- [xorg-xwayland](https://archlinux.org/packages/extra/x86_64/xorg-xwayland/)

### AUR

- [kvantum-theme-arc](https://aur.archlinux.org/packages/kvantum-theme-arc)

### Flatpak

#### Apps

Executables should be stored in /usr/local/bin

- [librewolf](https://flathub.org/apps/io.gitlab.librewolf-community)
- [pwvucontrol](https://flathub.org/apps/com.saivert.pwvucontrol)

#### Themes

- org.gtk.Gtk3theme.Arc-Dark

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
