# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export HISTSIZE=5000

# Load Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export JAVA_HOME="$HOME/.sdkman/candidates/java/current/bin/java"

export EDITOR="vim"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# export GOPATH=$HOME/go
# export PATH=$PATH:$GOPATH/bin
# eval "$(goenv init -)"

#source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
