

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Vim keybindings for the terminal
set -o vi
#bindkey -v

PATH=$PATH:~/bin:~/development/flutter/bin:/usr/lib/dart/bin:/home/bmarden/Android/Sdk/platform-tools:/usr/local/texlive/2020/bin/x86_64-linux


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
typeset -g HISTSIZE=290000 SAVEHIST=290000 HISTFILE=~/.zhistory ABSD=${${(M)OSTYPE:#*(darwin|bsd)*}:+1}
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
#
setopt interactive_comments hist_ignore_dups  octal_zeroes   no_prompt_cr  notify
setopt no_hist_no_functions no_always_to_end  append_history list_packed
setopt inc_append_history   complete_in_word  no_auto_menu   auto_pushd
setopt pushd_ignore_dups    no_glob_complete  no_glob_dots   c_bases
setopt numeric_glob_sort    share_history  promptsubst    auto_cd
setopt extended_history
setopt rc_quotes
autoload -Uz allopt zed zmv zcalc colors
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
zstyle ":completion:*:descriptions" format "%B%d%b"
zstyle ':completion:*:*:*:default' menu yes select search
zstyle ':completion:*:*:*:default' menu yes select

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions

zinit light zsh-users/zsh-completions
zinit light pawel-slowik/zsh-term-title

zinit pack for ls_colors
zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-history-substring-search
zinit snippet OMZ::lib/key-bindings.zsh
zinit wait lucid for \
  OMZ::plugins/common-aliases \
  OMZ::plugins/copydir \
  OMZ::plugins/cp \
  OMZ::plugins/encode64 \
  OMZ::plugins/extract \
  OMZ::plugins/jsontools \
# Get git plugin from oh-my-zsh
# Load OMZ Git library
zinit snippet OMZL::git.zsh

# Load Git plugin from OMZ
zinit snippet OMZP::git
# zinit cdclear -q # <- forget completions provided up to this moment
setopt promptsubst

# Load theme from OMZ
# zinit snippet OMZT::gnzh

# Load normal GitHub plugin with theme depending on OMZ Git library
# zinit light NicoSantangelo/Alpharized

# Export nvm to shell
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Example aliases
alias vim='nvim'
alias vimdiff='nvim -d'
alias cursem="cd $HOME/Dropbox/School/fa2020_csu/"
alias john='~/Programs/JohnTheRipper/run/john'
alias python='python3'
alias ivim="vim $HOME/.config/nvim/init.vim"
alias pip='pip3'
alias ls="ls -F --color"
alias ll="ls -lF --color"
alias la="ls -alF --color"

# Remove delay when entering normal mode (vi)
KEYTIMEOUT=5

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ $KEYMAP == main ]] || [[ $KEYMAP == viins ]] || [[ $KEYMAP = '' ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Start with beam shape cursor on zsh startup and after every command.
zle-line-init() { zle-keymap-select 'beam'}
