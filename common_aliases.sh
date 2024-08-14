TARGET_FILE="$HOME/.zshrc"

GIT_ALIAS='
  alias gst="git status"
  alias ga="git add"
  alias gc="git commit"
  alias gp="git push"
  alias gpl="git pull"
  alias gco="git checkout"
  alias gb="git branch"'

UPD_ALIAS='
  alias upd="apt-get update"
  alias upg="apt get upgrade"'

NVM='
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion'

DEFAULT_LS_ALIAS='
  alias ll="ls -alF"
  alias la="ls -A"
  alias l="ls -CF"'

EXA_ALIAS='
  alias ls="exa"                                                         # ls
  alias l="exa -lbF --git"                                               # list, size, type, git
  alias ll="exa -lbGF --git"                                             # long list
  alias llm="exa -lbGd --git --sort=modified"                            # long list, modified date sort
  alias la="exa -lbhHigUmuSa --time-style=long-iso --git --color-scale"  # all list
  alias lx="exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale" # all + extended list
  alias lS="exa -1"                                                      # one column, just names
  alias lt="exa --tree --level=2"'

getLSAlias() {
  if command -v exa &> /dev/null;
  then
      echo "$EXA_ALIAS";
  else
      echo "$DEFAULT_LS_ALIAS";
  fi
}

LS_ALIAS=$(getLSAlias)

putToFile() {
  if [ -f "$TARGET_FILE" ]; then
    if ! grep -qF "$1" "$TARGET_FILE"; then
      echo "$1" >> "$TARGET_FILE"
      echo "\n$1 put to $TARGET_FILE"
    else 
      echo "$1 already exists in $TARGET_FILE"
    fi
  else
    echo "No $TARGET_FILE file found"
  fi
}

putToFile "$LS_ALIAS"
putToFile "$NVM"
putToFile "$GIT_ALIAS"
putToFile "$UPD_ALIAS"


