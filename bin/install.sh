#!/bin/bash

echo "Starting script to setup my desktop environment for Ubuntu"

sudo add-apt-repository universe
sudo add-apt-repository ppa:lazygit-team/daily
sudo apt update
sudo apt -y upgrade
sudo apt install build-essential zsh git tig stow vim ack htop curl htop wget docker-ce lazygit \
  fonts-hack-ttf fonts-firacode silversearcher-ag fzf gcc make

if ! [ -d "${HOME}/.oh-my-zsh" ];
then
  echo "Oh my god! Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if ! [ -d "${HOME}/.pyenv" ];
then
  echo "Installing pyenv..."
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  echo "Installing python 3.7.1"
  pyenv install 3.7.1
  echo "Installing python 2.7.15"
  pyenv install 2.7.15
  echo "Setting python 3.7.1 as default"
  pyenv global 3.7.1
else
  echo "Upgrading pyenv..."
  cd $(pyenv root)
  git pull
fi

if ! command -v pip &> /dev/null
then
    echo "Installing pip..."
    curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
    python /tmp/get-pip.py
fi


if ! [ -d "${HOME}/.sdkman" ];
then
  echo "Installing sdkman..."
  curl -s "https://get.sdkman.io" | bash
fi

if ! [ -d "${HOME}/.nvm" ];
then
  echo "Installing nvm..."
  export NVM_DIR="$HOME/.nvm" && (
    git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
    cd "$NVM_DIR"
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
  ) && \. "$NVM_DIR/nvm.sh"
else
  (
    cd "$NVM_DIR"
    git fetch --tags origin
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
  ) && \. "$NVM_DIR/nvm.sh"
fi

# setup .dotfiles
cd $HOME/.dotfiles
stow git
stow oh-my-zsh
stow ssh
stow vim

