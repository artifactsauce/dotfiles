# .zshrc

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export EDITOR='vi'
export VISUAL='vi'
export HISTSIZE=50000
export LESS='-R'
if which -s src-hilite-lesspipe.sh > /dev/null; then
  export LESSOPEN='| '$(which src-hilite-lesspipe.sh)' %s'
fi

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export STUDIO_JDK="$JAVA_HOME"

export GOPATH=$HOME
PATH=$HOME/vendor/bin:$GOPATH/bin:$PATH
PATH=$HOME/src/github.com/artifactsauce/proglets/bin:$PATH # public
PATH=$HOME/src/gitlab.com/artifactsauce/proglets/bin:$PATH # private
eval "$($HOME/src/github.com/artifactsauce/proglets/bin/mpkg init -)"
eval "$($HOME/src/github.com/artifactsauce/proglets/bin/generate init -)"
eval "$($HOME/src/github.com/artifactsauce/proglets/bin/pm init -)"
eval "$($HOME/src/github.com/artifactsauce/proglets/bin/batchrepos init -)"

while read; do
  [[ "$REPLY" =~ ^\# ]] && continue
  [ -f "$HOME/.zshrc.d/$REPLY" ] && source $HOME/.zshrc.d/$REPLY
done <<EOF
functions
peco
interpreter
arch/$(uname)
EOF

if which -s hub     > /dev/null; then eval "$(hub alias -s)"; fi
if which -s direnv  > /dev/null; then eval "$(direnv hook zsh)"; fi
if which -s bundle  > /dev/null; then alias be="bundle exec"; fi
if [ -f "$HOME/.travis/travis.sh" ]; then source $HOME/.travis/travis.sh; fi
