# dot-files

Configuration files and miscellaneous files for my personal linux setups.

Meant for general purpose systems with a GUI.

## Requirements

I have only included links and packages relevant for Arch.

Not all packages listed here are a hard requirement and this list might not be exhaustive.

### Arch repo

- [alacritty](https://archlinux.org/packages/extra/x86_64/alacritty/)
- [apparmor](https://archlinux.org/packages/extra/x86_64/apparmor/)
- [bash-completion](https://archlinux.org/packages/extra/any/bash-completion/)
- [bat](https://archlinux.org/packages/extra/x86_64/bat/)
- [blueman](https://archlinux.org/packages/extra/x86_64/blueman/)
- [brightnessctl](https://archlinux.org/packages/extra/x86_64/brightnessctl/)
- [dbus](https://archlinux.org/packages/core/x86_64/dbus/)
- [devtools](https://archlinux.org/packages/extra/any/devtools/)
- [dust](https://archlinux.org/packages/extra/x86_64/dust/)
- [eza](https://archlinux.org/packages/extra/x86_64/eza/)
- [fastfetch](https://archlinux.org/packages/extra/x86_64/fastfetch/)
- [fd](https://archlinux.org/packages/extra/x86_64/fd/)
- [flatpak](https://archlinux.org/packages/extra/x86_64/flatpak/)
- [git-delta](https://archlinux.org/packages/extra/x86_64/git-delta/)
- [git](https://archlinux.org/packages/extra/x86_64/git/)
- [glow](https://archlinux.org/packages/extra/x86_64/glow/)
- [gnome-keyring](https://archlinux.org/packages/extra/x86_64/gnome-keyring/)
- [gnupg](https://archlinux.org/packages/core/x86_64/gnupg/)
- [grim](https://archlinux.org/packages/extra/x86_64/grim/)
- [gsettings-desktop-schemas](https://archlinux.org/packages/extra/any/gsettings-desktop-schemas/)
- [hyperfine](https://archlinux.org/packages/extra/x86_64/hyperfine/)
- [kanshi](https://archlinux.org/packages/extra/x86_64/kanshi/)
- [libsecret](https://archlinux.org/packages/core/x86_64/libsecret/)
- [networkmanager](https://archlinux.org/packages/extra/x86_64/networkmanager/)
- [nextcloud-client](https://archlinux.org/packages/extra/x86_64/nextcloud-client/)
- [nwg-bar](https://archlinux.org/packages/extra/x86_64/nwg-bar/)
- [pacman-contrib](https://archlinux.org/packages/extra/x86_64/pacman-contrib/)
- [pipewire-alsa](https://archlinux.org/packages/extra/x86_64/pipewire-alsa/)
- [pipewire-jack](https://archlinux.org/packages/extra/x86_64/pipewire-jack/)
- [pipewire-pulse](https://archlinux.org/packages/extra/x86_64/pipewire-pulse/)
- [pipewire](https://archlinux.org/packages/extra/x86_64/pipewire/)
- [polkit-gnome](https://archlinux.org/packages/extra/x86_64/polkit-gnome/)
- [procs](https://archlinux.org/packages/extra/x86_64/procs/)
- [python](https://archlinux.org/packages/core/x86_64/python/)
- [ripgrep](https://archlinux.org/packages/extra/x86_64/ripgrep/)
- [sway](https://archlinux.org/packages/extra/x86_64/sway/)
- [swaybg](https://archlinux.org/packages/extra/x86_64/swaybg/)
- [swayidle](https://archlinux.org/packages/?name=swayidle)
- [swaylock](https://archlinux.org/packages/extra/x86_64/swaylock/)
- [swaync](https://archlinux.org/packages/extra/x86_64/swaync/)
- [systemd](https://archlinux.org/packages/core/x86_64/systemd/)
- [usbguard](https://archlinux.org/packages/extra/x86_64/usbguard/)
- [waybar](https://archlinux.org/packages/extra/x86_64/waybar/)
- [wofi](https://archlinux.org/packages/extra/x86_64/wofi/)
- [xdg-dbus-proxy](https://archlinux.org/packages/extra/x86_64/xdg-dbus-proxy/)
- [xdg-desktop-portal-wlr](https://archlinux.org/packages/extra/x86_64/xdg-desktop-portal-wlr/)
- [xdg-user-dirs](https://archlinux.org/packages/extra/x86_64/xdg-user-dirs/)
- [xdg-utils](https://archlinux.org/packages/extra/any/xdg-utils/)
- [xorg-xwayland](https://archlinux.org/packages/extra/x86_64/xorg-xwayland/)

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
