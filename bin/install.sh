#!/bin/bash

echo "Starting..."

xcode-select --install

if ! which brew >/dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade
brew cleanup

brew cask install p4merge
brew cask install keepingyouawake
brew cask install docker
brew cask install postman
brew cask install visual-studio-code
brew install zsh
brew install hh
brew install tig
brew install stow
brew install wget
brew install ack
brew install htop
brew install ssh-copy-id
brew install git
brew install nvm
brew install pyenv
brew install rbenv
brew install goenv
brew install oath-toolkit # (umask 0077;pbpaste > ~/.totp_github) # totp() { oathtool --totp -b $(<~/".totp_${1:-wmt}") | pbcopy; }

# Install oh-my-zsh
if ! [ -d "${HOME}/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
if ! grep "/usr/local/bin/zsh" /etc/shells >/dev/null; then
    echo "Set zsh as default shell"
    command -v zsh | sudo tee -a /etc/shells
    sudo chsh -s "$(command -v zsh)" "${USER}"
fi

# setup .dotfiles
cd $HOME/.dotfiles
stow git
stow oh-my-zsh
stow ssh

# Setup rbenv
if ! [ -d "${HOME}/.rbenv" ]; then
    rbenv init
    eval "$(rbenv init -)"
    rbenv install 2.4.1
    rbenv global 2.4.1
fi

# Setup nvm
if ! [ -d "${HOME}/.nvm" ]; then
    mkdir ~/.nvm
    export NVM_DIR="$HOME/.nvm"
    . "/usr/local/opt/nvm/nvm.sh"
fi

# Setup pyenv
if ! [ -d "${HOME}/.pyenv" ]; then
    pyenv install 3.6
    pyenv install 2.7
    pyenv global 3.6.2
fi
if ! which pip >/dev/null; then
    echo "Installing PIP"
    wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py
    sudo python /tmp/get-pip.py
fi

# Setup Java
if ! [ -d "${HOME}/.sdkman" ]; then
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk install java 8u131
    sdk default java 8u131
    sdk install maven
fi


