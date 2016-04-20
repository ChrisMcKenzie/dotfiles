# path, the 0 in the filename causes this to load first
export GOBIN=$HOME/gocode/bin
path=(
  $path
  $HOME/.yadr/bin
  $HOME/.yadr/bin/yadr
  $HOME/.rvm/bin
  $HOME/node_modules/.bin
  $HOME/Library/Android/sdk/platform-tools/
  $HOME/go_appengine
  $GOBIN
)
export GOPATH=$HOME/gocode
export PROJECTS=$HOME/Projects
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# The next line updates PATH for the Google Cloud SDK.
source '/Users/chrism/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/chrism/google-cloud-sdk/completion.zsh.inc'
