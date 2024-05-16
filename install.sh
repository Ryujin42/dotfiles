#!/bin/sh

# yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && sudo rm -rf yay

# use config files
ln -s ~/dotfiles/alacritty ~/.config/
ln -s ~/dotfiles/awesome ~/.config/
ln -s ~/dotfiles/nvim ~/.config/
ln -s ~/dotfiles/rofi ~/.config/

# install everything
yay -Sy arandr autorandr brave-bin brightnessctl btop code discord filezilla flameshot fzf galculator nautilus neofetch noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra pavucontrol rofi tree ttf-jetbrains-mono ttf-jetbrains-mono-nerd zoxide zsh
# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ~/dotfiles/.zshrc ~
