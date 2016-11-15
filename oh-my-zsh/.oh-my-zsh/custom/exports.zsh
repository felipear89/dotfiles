# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export HISTSIZE=5000

# Load Node Version Manager
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

export JAVA_HOME=$(/usr/libexec/java_home)

# export PATH=~/Development/mongodb/bin:$PATH
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# Load pyenv
eval "$(pyenv init -)"
