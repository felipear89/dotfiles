# Setup pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Setup sdkman
export SDKMAN_DIR="/home/felipe.rodrigues/.sdkman"
[[ -s "/home/felipe.rodrigues/.sdkman/bin/sdkman-init.sh" ]] && source "/home/felipe.rodrigues/.sdkman/bin/sdkman-init.sh"

# Setup nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

export HISTSIZE=5000
export EDITOR="vim"
export JAVA_HOME="$HOME/.sdkman/candidates/java/current"
