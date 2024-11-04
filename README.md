# dotfiles

## General informations
- OS: [Arch Linux](https://archlinux.org/)
- WM: [Hyprland](https://hyprland.org/)
- bar: [Waybar](https://github.com/Alexays/Waybar)
- launcher: [Rofi](https://github.com/davatorium/rofi)
- terminal: [Alacritty](https://github.com/alacritty/alacritty)

- general theme: [Catpuccin Macchiato](https://github.com/catppuccin/catppuccin)

## Arch install

```bash
pacman-key --init && pacman-key --populate archlinux
pacman -S archlinux-keyring
archinstall
```

disk format : ext4 <br>
network config : NetworkManager <br>
additional packages : git neovim
yay -S xorg-server xorg-xinit alacritty hyprland`


## first boot
- check keyboard layout, locale, internet connexion etc
- cloning this repo 
```bash
git clone https://github.com/Ryujin42/dotfiles.git
```
- run the installation script (symlinks && yay, zsh, and utilities packages installation)
```bash
cd ~/dotfiles
chmod -x ./install.sh 
./install.sh
```

