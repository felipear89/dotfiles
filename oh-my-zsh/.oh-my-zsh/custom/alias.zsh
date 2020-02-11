alias g='git'

alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias diskspace_report="df -P -kHl"
alias lg="lazygit"
alias cp="cp -vi"
alias mv="mv -vi"

alias du='du -h'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias two-monitors="xrandr --output HDMI-1 --auto && xrandr --output HDMI-1 --above eDP-1"
alias single-monitor="xrandr --output HDMI-1 --off"
alias mirror-monitor="xrandr --output HDMI-1 --auto --same-as eDP-1"
alias mouse-logitech="xinput --set-prop \"Logitech M510\" \"libinput Accel Speed\" -0.5"
alias mouse-dell="xinput --set-prop \"DELL0839:00 04F3:30C3 Touchpad\" \"libinput Accel Speed\" -0.7"
alias k8s-restart="kubectl rollout restart deploy"
