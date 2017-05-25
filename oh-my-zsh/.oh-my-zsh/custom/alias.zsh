alias g='git'

alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias cp='cp -v'
alias mv='mv -v'

alias gzip_='tar -zcvf'
alias bzip_='tar -jcvf'

alias diskspace_report="df -P -kHl"

alias brew_update="brew -v update; brew upgrade --force-bottle --cleanup; brew cleanup; brew cask cleanup; brew prune; brew doctor; npm-check -g -u"
