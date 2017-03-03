#!/bin/bash

echo "Starting"

xcode-select --install

# Check Homebrew
if ! which brew >/dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew cask install java
brew cask install Caskroom/versions/intellij-idea-ce
brew cask install vlc
brew cask install transmission
brew cask install google-chrome
brew cask install p4merge
brew cask install dropbox
brew cask install docker
brew cask install anki
brew cask install postman
brew cask install keepingyouawake
brew cask install sublime-text
brew cask install visual-studio-code
brew cask install robomongo
brew install zsh
brew install stow
brew install wget
brew install ack
brew install nvm
brew install pyenv
brew install heroku
brew install autoenv
brew install postgresql
brew install httpie
brew install redis
brew install mongodb
brew update
brew upgrade
brew cleanup
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

# Node Version Manager
if ! [ -d "${HOME}/.nvm" ]; then
    mkdir ~/.nvm
fi

# Go Version Manager
if ! [ -d "${HOME}/.gvm" ]; then
    zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
fi

# Python setup
pyversion=$( pyenv version )
if [[ ! $pyversion == *"3.5.2"* ]]
then
  pyenv install 3.5.2
fi
pyenv global 3.5.2
if ! which pip >/dev/null; then
    echo "Installing PIP"
    wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py
    sudo python /tmp/get-pip.py
    sudo pip install virtualenv
fi

# Create data directory. Required by mongodb
sudo mkdir -p /data/db
sudo chown -R `id -u` /data/db
