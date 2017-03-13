#!/bin/env bash
set -e

pacman-mirrors -c United_States

pacman -Syu
pacman -S --noconfirm google-chrome-stable
pacman -S --noconfirm zsh
pacman -S --noconfirm tmux
pacman -S --noconfirm ttf-fira-mono ttf-fira

#set up zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

