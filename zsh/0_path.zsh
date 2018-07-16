# path, the 0 in the filename causes this to load first
export GOBIN=$HOME/go/bin
path=(
  $path
  $HOME/.yadr/bin
  $HOME/.yadr/bin/yadr
  $HOME/.rvm/bin
  $HOME/node_modules/.bin
  $HOME/Library/Android/sdk/platform-tools/
  $HOME/go_appengine
  $HOME/.minimesos/bin
  /usr/local/go/bin
  $GOBIN
)
export GOPATH=$HOME/go
export PROJECTS=$HOME/Projects
# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh
