shopt -s histappend
PROMPT_COMMAND='history -a'

alias ll='ls -al'

alias search='apt-cache search'
alias show='apt-cache show'
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade -uy'

# enable bash completion in interactive shells
if ! shopt -oq posix; then
if [ -f /usr/share/bash-completion/bash_completion ]; then
. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi
fi

export PATH=$PATH:"/opt/microchip/xc8/v1.31/bin"
