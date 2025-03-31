#
# ~/.bashrc
#

[[ $- != *i* ]] && return

export PATH="$HOME/bin:$PATH"
export MANPAGER="nvim +Man!"
export EDITOR="nvim" 
export TERMINAL="kitty" 
export BRONSER="firefox" 
export READER="zathura"
export PREFIX="~/.local"

HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoredups
shopt -s histappend

if [ -d "$HOME/.local/bin/scripts" ] ; then
    export PATH=$HOME/.local/bin/scripts:$PATH
fi
if [ -d "$HOME/.local/bin/system" ] ; then
    export PATH=$HOME/.local/bin/system:$PATH
fi
if [ -d "$HOME/.local/bin" ] && [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

alias yaourt='paru'
alias yay='paru'


alias rm='rm -i'

alias cat='bat --style=grid'
alias grep='rg'
alias cp='xcp'
alias ls='ls --color=auto'
alias grep='grep --color=auto'


alias vim='nvim'
alias vi='nvim'
alias nano='nvim'
alias notes='nvim ~/Documents/vimwiki/notes/'

alias hrg='history | rg'

#PS1='[\u@\h \W]\$ ' old one

parse_git_branch() {
    git branch 2>/dev/null | grep '*' | sed 's/* /🌿/'
}

export PS1="\[\e[32m\]\u@\h:\[\e[34m\]\w\[\e[0m\]\$(parse_git_branch)$ "

echo -e "              Howdy, \033[35m$(whoami)\033[37m!"
echo "   /ᐠ-˕-マ  ノ"
echo "乀(  J し)"
