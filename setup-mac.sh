#!/bin/bash
set -eu
set -o pipefail
set -x 

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
brew install \
    htop

brew cask install \
    visual-studio-code \
    google-chrome \
    iterm2 \
    webstorm \
    slack \
    authy \
    flux \
    virtualbox \
    vagrant \
    transmission \
    alfred \  
    bartender \
    spectacle \
    mercurial 

# VSCode Extensions
code \
  --install-extension vscodevim.vim \ 
  --install-extension lukehoban.Go 

# Go
brew install golang
mkdir -p ~/go

# NodeJS
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
source ~/.zshrc
LATEST_NODE=$(nvm ls-remote | tail -n 1 | xargs) #xargs trims whitespace...
echo installing $LATEST_NODE

# Rust
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
mkdir -p ~/.zfunc
rustup completions zsh > ~/.zfunc/_rustup
source ~/.zshrc

# Vim
brew tap caskroom/fonts
brew cask install \
  font-dejavu-sans-mono-for-powerline \
  font-droid-sans-mono-for-powerline \
  font-meslo-lg font-input \
  font-inconsolata font-inconsolata-for-powerline \
  font-liberation-mono-for-powerline \
  font-liberation-sans \
  font-meslo-lg \
  font-nixie-one \
  font-office-code-pro \
  font-pt-mono \
  font-raleway font-roboto \
  font-source-code-pro font-source-code-pro-for-powerline \
  font-source-sans-pro \
  font-ubuntu

brew install nvim
rm -rf ~/.SpaceVim
curl -sLf https://spacevim.org/install.sh | bash
yadm checkout -- ~/.SpaceVim
