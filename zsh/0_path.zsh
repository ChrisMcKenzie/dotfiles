# path, the 0 in the filename causes this to load first

export GOPATH=$HOME/gocode
export GOBIN=$GOPATH/bin
export PROJECTS=$HOME/Projects
eval $(boot2docker shellinit 2>/dev/null)
path=(
  $path
  $HOME/.yadr/bin
  $HOME/.yadr/bin/yadr
  $HOME/.rvm/bin
  $HOME/node_modules/.bin
  $HOME/Library/Android/sdk/platform-tools/
  $GOBIN
)

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*



