#!/bin/env bash
set -e

#fix dat mac keyboard
/bin/bash -c "echo 'options hid_apple iso_layout=0' > /etc/modprobe.d/hid_apple.conf"

#update whole system
pacman-mirrors -c United_States
pacman -Syu

#install things that I like
pacman -S --noconfirm google-chrome-stable
pacman -S --noconfirm zsh
pacman -S --noconfirm tmux
pacman -S --noconfirm ttf-fira-mono ttf-fira

#set up zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

#zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

