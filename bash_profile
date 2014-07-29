# .bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.bashrc.d/functions ]] && . ~/.bashrc.d/functions

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR=vi
export PAGER=less

PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
GREP_OPTIONS='--color=auto'

alias ls="ls --color"
alias be="bundle exec"

case `uname` in
  "Darwin") [[ -f ~/.bashrc.d/mac ]] && . ~/.bashrc.d/mac;;
   "Linux") [[ -f ~/.bashrc.d/linux ]] && . ~/.bashrc.d/linux;;
         *) echo "Unexpected system name: `uname`";;
esac

export GOPATH=$HOME
PATH=$HOME/local/bin:$HOME/bin:$PATH
PATH=$HOME/.emacs.d/.cask/bin:$PATH
PATH=$HOME/src/bitbucket.org/artifactsauce/proglets/bin:$PATH

[[ -n $(type -t pyenv) ]] && eval "$(pyenv init -)"
[[ -n $(type -t rbenv) ]] && eval "$(rbenv init -)"
[[ -s "$HOME/.perlbrew/etc/bashrc" ]] && . "$HOME/.perlbrew/etc/bashrc"
