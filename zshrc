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
export GOPROXY=direct
export GOSUMDB=off

while read; do
  [ -f "$HOME/.zshrc.d/$REPLY" ] && source $HOME/.zshrc.d/$REPLY
done <<EOF
path
interpreter
completion
alias
subinit
peco
curl
direnv
arch/$(uname)
command
EOF

HIDDEN_ENV_FILE="~/Dropbox/conf/hidden_env.rc"
[ -f "$HIDDEN_ENV_FILE" ] && . "$HIDDEN_ENV_FILE"

typeset -gU PATH
