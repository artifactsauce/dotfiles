# .bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.bashrc.d/functions ]] && . ~/.bashrc.d/functions

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR=vi
export PAGER=less

PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

alias ls="ls --color"
alias grep='grep --color=auto'
alias be="bundle exec"

case `uname` in
  "Darwin")
    [[ -f ~/.bashrc.d/develop ]] && . ~/.bashrc.d/develop
    [[ -f ~/.bashrc.d/mac ]]     && . ~/.bashrc.d/mac
    ;;
   "Linux") [[ -f ~/.bashrc.d/linux ]] && . ~/.bashrc.d/linux;;
         *) echo "Unexpected system name: `uname`";;
esac

[[ -d ~/.bashrc.d/hidden ]] && . ~/.bashrc.d/hidden/*
