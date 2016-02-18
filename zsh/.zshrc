# Created by newuser for 5.0.2
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

source /opt/zsh-git-prompt/zshrc.sh
# prompt with git
export PS1="%{[36;1m%}%T %{[31m%}%n%{[33m%}@%{[37m%}%m %{[32m%}%~ %{[37m%}$(git_super_status) %{[33m%}%#%{[0m%}"
