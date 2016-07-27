# atom
# spotify
# java
# slack
# sqldeveloper
# intellij
# copyclip
# vlc
# Dropbox
# Postman
# brew
# rbenv
# nvm
# tmux

open "${HOME}/.dotfiles/iterm/Chalk.itermcolors"

brew install wget
brew install ack
brew cleanup

wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py
sudo python /tmp/get-pip.py
sudo pip install --upgrade bumpversion
