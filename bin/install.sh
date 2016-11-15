echo "Starting"

brew cask install java
brew cask install sublime-text
brew cask install intellij-idea
brew cask install vlc
brew cask install transmission
brew cask install google-chrome
brew cask install p4merge

brew install zsh
brew install stow
brew install wget
brew install ack
brew install nvm
brew install pyenv
brew cleanup

if ! [ -d "${HOME}/.oh-my-zsh" ]; then
	echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if ! grep "/usr/local/bin/zsh" /etc/shells >/dev/null; 
then
	echo "Set zsh as default shell"
    command -v zsh | sudo tee -a /etc/shells
    sudo chsh -s "$(command -v zsh)" "${USER}"
fi

if ! which pip >/dev/null; then
	echo "Installing PIP"
    wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py
	sudo python /tmp/get-pip.py
fi

if ! [ -d "${HOME}/.nvm" ]; then
    mkdir ~/.nvm
fi

if ! [ -d "${HOME}/.gvm" ]; then
	zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
fi

cd $HOME/.dotfiles
stow git
stow oh-my-zsh
stow ssh
