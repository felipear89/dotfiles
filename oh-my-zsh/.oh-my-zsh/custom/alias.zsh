alias g='git'
alias v="vim"

# REMOVE STOPPED CONTAINERS
alias docker-clean-stopped='docker ps -aq --no-trunc | xargs docker rm'
# REMOVE DANGLING/UNTAGGED IMAGES
alias docker-clean-untagged='docker images -q --filter dangling=true | xargs docker rmi'
