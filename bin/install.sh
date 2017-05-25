#!/bin/bash

echo "Starting..."

xcode-select --install

if ! which brew >/dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! which sdk >/dev/null; then
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

brew update
brew upgrade
brew cleanup

brew cask install p4merge
brew cask install docker
brew cask install postman
brew cask install keepingyouawake
brew cask install sublime-text
brew cask install visual-studio-code
brew cask install robomongo
brew install zsh
brew install stow
brew install nvm
brew install pyenv
brew install rbenv 
brew install wget
brew install ack
brew install heroku
brew install autoenv
brew cask list | xargs brew cask install --force

if ! [ -d "${HOME}/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
if ! grep "/usr/local/bin/zsh" /etc/shells >/dev/null; then
    echo "Set zsh as default shell"
    command -v zsh | sudo tee -a /etc/shells
    sudo chsh -s "$(command -v zsh)" "${USER}"
fi

cd $HOME/.dotfiles
stow git
stow oh-my-zsh
stow ssh

rbenv init
eval "$(rbenv init -)"

# Node Version Manager
if ! [ -d "${HOME}/.nvm" ]; then
    mkdir ~/.nvm
fi

# Python setup
pyversion=$( pyenv version )
if [[ ! $pyversion == *"3.6.0"* ]]; then
  pyenv install 3.6.0
fi
pyenv global 3.6.0

if ! which pip >/dev/null; then
    echo "Installing PIP"
    wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py
    sudo python /tmp/get-pip.py
    sudo pip install virtualenv
fi

rbenv install 2.4.1
rbenv global 2.4.1

sdk install java 8u131
sdk default java 8u131
sdk install maven
