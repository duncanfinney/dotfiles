#!/bin/bash

# get homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# clone the dotfiles
brew install yadm
yadm clone https://github.com/duncanfinney/dotfiles.git

# zsh
brew install zsh git thefuck
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
yadm reset --hard
#zsh plugins
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# set the default shell
sudo chsh -s $(which zsh)

# get all the other cool stuff I like
brew cask install \
    visual-studio-code \
    google-chrome \
    iterm2 \
    webstorm \
    slack
