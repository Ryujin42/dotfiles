# dotfiles

## General informations
- OS: [Arch Linux](https://archlinux.org/)
- WM: [hyprland](https://hyprland.org/)
- bar: [waybar](https://github.com/Alexays/Waybar)
- launcher: [rofi](https://github.com/davatorium/rofi)

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
