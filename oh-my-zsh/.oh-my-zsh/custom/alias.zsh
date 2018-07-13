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

alias mvnSonarLocal='mvn clean jacoco:prepare-agent package -U jacoco:report sonar:sonar -Dsonar.host.url="http://127.0.0.1:9001" -Dsonar.jdbc.url="jdbc:h2:tcp://127.0.0.1/sonar"'
alias mvnSonarMutationLocal='mvn clean jacoco:prepare-agent install -U org.pitest:pitest-maven:mutationCoverage jacoco:report sonar:sonar -Dsonar.host.url="http://127.0.0.1:9001"'
alias docker-sonar-up='sudo docker run -d --name sonarqubeLocalNetshoes -p 9001:9000 -p 9092:9092 arturbdr/sonarqube-pluggins:6.7.1.1-lts'
alias mutationCov='mvn org.pitest:pitest-maven:mutationCoverage'
