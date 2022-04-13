
alias vim="nvim"
alias ivim="vim ~/.config/nvim/init.vim"
alias startgp="launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*"
alias stopgp="launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*"
alias ls="gls -F --color"
alias ll="gls -lF --color"
alias la="gls -alF --color"
alias gitdsq='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch\^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'
alias gitdsqdry='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && echo "$branch is merged into master and can be deleted"; done'
alias chromedebug='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222 --user-data-dir="$HOME/Library/Application\ Support/Google/Chrome/Debug"'
# check current ports in use
alias chkport="lsof -i -P | grep LISTEN | grep $1"

# handy to see what's taking up space in a directory
alias dirspace="du -hs * | sort -h"

# unalias annoying rm prompt
alias rm="rm"
