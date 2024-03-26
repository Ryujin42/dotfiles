# dotfiles

## Arch install

```bash
pacman-key --init && pacman-key --populate archlinux
pacman -S archlinux-keyring
archinstall
```

format du disque : ext4 <br>
config reseau : NetworkManager <br>
packages additionels : git neovim

## first boot

- check la co
- installer [yay](https://github.com/Jguer/yay)
- installer zsh (avec yay) et [oh-my-zsh](https://ohmyz.sh/#install) (avec curl)
- `yay -S xorg-server xorg-xinit alacritty awesome`

## first awesome boot

```bash
echo 'exec awesome' > ~/.xinitrc
startx
```
