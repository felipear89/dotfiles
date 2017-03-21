# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export HISTSIZE=5000

# Load Node Version Manager
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

export JAVA_HOME="$HOME/.sdkman/candidates/java/current/bin/java"

export EDITOR="vim"

# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# Load pyenv
eval "$(pyenv init -)"
source $(brew --prefix autoenv)/activate.sh
