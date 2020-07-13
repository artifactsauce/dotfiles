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

if type hub     &> /dev/null; then eval "$(hub alias -s)"; fi
if type direnv  &> /dev/null; then eval "$(direnv hook zsh)"; fi
if type bundle  &> /dev/null; then alias be="bundle exec"; fi
if [ -f "$HOME/.travis/travis.sh" ]; then source $HOME/.travis/travis.sh; fi

while read; do
  [ -f "$HOME/.zshrc.d/$REPLY" ] && source $HOME/.zshrc.d/$REPLY
done <<EOF
path
cmdinit
interpreter
functions
peco
curl
arch/$(uname)
EOF

HIDDEN_ENV_FILE="~/Dropbox/conf/hidden_env.rc"
[ -f "$HIDDEN_ENV_FILE" ] && . "$HIDDEN_ENV_FILE"

typeset -gU PATH
