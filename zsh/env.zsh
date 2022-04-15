export GOPATH=$HOME/go
export GOROOT="/usr/local/opt/go/libexec"
export LS_COLORS="$(vivid generate molokai)"

path=(/Users/bmarden/.local/bin /usr/local/opt/python@3.10/bin /Users/bmarden/Library/Python/3.10/bin \
  /usr/local/bin /usr/local/sbin $HOME/bin /opt/homebrew/bin /opt/homebrew/sbin \
  $HOME/.yarn/bin $HOME/.config/yarn/global/node_modules/.bin  $HOME/.dotnet/tools $GOPATH/bin \ 
  $GOROOT/bin $HOME/Library/Android/sdk/platform-tools $path)

export PATH
