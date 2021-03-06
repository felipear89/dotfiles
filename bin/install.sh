#!/bin/bash

echo "Starting..."

xcode-select --install

if ! which brew >/dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade
brew cleanup

brew cask install p4v
brew cask install keepingyouawake
brew cask install docker
brew cask install postman
brew cask install visual-studio-code
brew cask install caskroom/fonts/font-hack
brew cask install keeweb
brew install zsh
brew install hh
brew install tig
brew install stow
brew install wget
brew install ack
brew install htop
brew install ssh-copy-id
brew install git
brew install pyenv
brew install rbenv
brew install goenv

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
stow vim

# Setup rbenv
if ! [ -d "${HOME}/.rbenv" ]; then
    echo "installing ruby"
    rbenv init
    eval "$(rbenv init -)"
    rbenv install 2.5.1
    rbenv global 2.5.1
fi

# Setup nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# Setup pyenv
if ! [ -d "${HOME}/.pyenv" ]; then
    echo "installing python"
    pyenv install 3.7.0
    pyenv install 2.7.15
    pyenv global 3.7.0
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
    sdk install java 8.0.181-oracle
    sdk default java 8.0.181-oracle
    sdk install maven
fi

if ! [ -d "${HOME}/.goenv" ]; then
    goenv install 1.9.0
    goenv global 1.9.0
fi


