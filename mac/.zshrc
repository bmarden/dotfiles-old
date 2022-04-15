source ~/zsh/antigen.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export GOPATH=$HOME/go
export GOROOT="/usr/local/opt/go/libexec"
export LS_COLORS="$(vivid generate molokai)"

path=(/Users/bmarden/.local/bin /usr/local/opt/python@3.10/bin /Users/bmarden/Library/Python/3.10/bin \
  /usr/local/bin /usr/local/sbin $HOME/bin /opt/homebrew/bin /opt/homebrew/sbin \
  $HOME/.yarn/bin $HOME/.config/yarn/global/node_modules/.bin  $HOME/.dotnet/tools $GOPATH/bin \ 
  $GOROOT/bin $HOME/Library/Android/sdk/platform-tools $path)

export PATH

setopt interactive_comments hist_ignore_dups  octal_zeroes   no_prompt_cr  notify
setopt no_hist_no_functions no_always_to_end  append_history list_packed
setopt inc_append_history   complete_in_word  no_auto_menu   auto_pushd
setopt pushd_ignore_dups    no_glob_complete  no_glob_dots   c_bases
setopt numeric_glob_sort    share_history  promptsubst    auto_cd
setopt extended_history     inc_append_history_time
setopt rc_quotes
autoload -Uz allopt zed zmv zcalc colors 
colors

# zstyle ':completion:*:*:kill:*' menu yes select
# zstyle ':completion:*:kill:*'   force-list always
# zstyle ":completion:*:descriptions" format "%B%d%b"
# zstyle ':completion:*:*:*:default' menu yes select search
# zstyle ':completion:*:*:*:default' menu yes select
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# zstyle ":completion:*:default" list-colors "${(s.:.)LS_COLORS}"
zstyle :completion:\* menu select

# 1password plugin
eval "$(op completion zsh)"; compdef _op op

antigen use oh-my-zsh
# 
# # Bundles from the default repo
antigen bundle git
antigen bundle heroku
antigen bundle docker
antigen bundle common-aliases
# # antigen bundle nvm
# # antigen bundle tmux
antigen bundle asdf

antigen bundle zsh-users/zsh-history-substring-search

# syntax highlighting

# Fish-like auto suggestions
antigen bundle zsh-users/zsh-autosuggestions

# Extra zsh completions
antigen bundle zsh-users/zsh-completions

# Theme
antigen theme romkatv/powerlevel10k


# Vim mode
antigen bundle jeffreytse/zsh-vi-mode

# antigen bundle zsh-users/zsh-syntax-highlighting

# antigen bundle trapd00r/LS_COLORS

# antigen bundle zdharma-continuum/fast-syntax-highlighting

antigen apply


# Load aliases
source $HOME/zsh/alias.zsh

source /Users/bmarden/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
