# .zshrc

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export HISTSIZE=50000
export EDITOR='vi'
export VISUAL='vi'
export LESS='-R'
if which -s src-hilite-lesspipe.sh > /dev/null; then
  export LESSOPEN='| '$(which src-hilite-lesspipe.sh)' %s'
fi

export GOPATH=$HOME

while read; do
  [ -f "$HOME/.zshrc.d/$REPLY" ] && source $HOME/.zshrc.d/$REPLY
done <<EOF
path
interpreter
functions
completion
alias
command
subinit
peco
curl
arch/$(uname)
EOF

HIDDEN_ENV_FILE="~/Dropbox/conf/hidden_env.rc"
[ -f "$HIDDEN_ENV_FILE" ] && . "$HIDDEN_ENV_FILE"

typeset -gU PATH
