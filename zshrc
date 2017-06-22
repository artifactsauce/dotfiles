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

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export STUDIO_JDK="$JAVA_HOME"

export GOPATH=$HOME
PATH=$GOPATH/bin:$PATH
PATH=$HOME/Dropbox/vendor/bin:$PATH
PATH=$HOME/Dropbox/vendor/bin/$(uname):$PATH
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

if type hub     &> /dev/null; then eval "$(hub alias -s)"; fi
if type direnv  &> /dev/null; then eval "$(direnv hook zsh)"; fi
if type bundle  &> /dev/null; then alias be="bundle exec"; fi
if [ -f "$HOME/.travis/travis.sh" ]; then source $HOME/.travis/travis.sh; fi
