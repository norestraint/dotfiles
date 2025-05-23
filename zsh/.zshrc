# Used when theres a need to profile the zsh init logs
# zmodload zsh/zprof
DISABLE_UNTRACKED_FILES_DIRTY="true"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set the directory to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit , if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Completion style to match lowercase letters with uppercase letters(eg. 'cd d' will suggest Downloads folder)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Add colors to completions
eval "$(dircolors -b)"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Disable default zshell completion
zstyle ':completion:*' menu no

# Add preview on completion windows
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Add preview on zoxide
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

# Add snippets from OhMyZShell
zinit snippet OMZP::command-not-found

# Load completions 
# autoload -U compinit && compinit

export fpath=(~/.zsh/functions $fpath)
fpath+=~/.zfunc

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# Used by zinit to replay cashed completions
zinit cdreplay -q

# Initialize prompt
# eval "$(oh-my-posh init zsh --config $HOME/dotfiles/ohmyposh/custom.toml)"
eval "$(starship init zsh)"

# Keymaps
bindkey -e # Chech if there is a vim mode for this
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Aliases

# Load files/directories with neovim.
source "$HOME/dotfiles/remaps.sh"

# Load pdfs with zathura.
alias rb='zathura $(find $HOME/Documents/books | fzf --tmux) &'

# pacman utilities.
alias pacs='pacman -Ss'
alias paci='sudo pacman -S'
alias pacu='sudo pacman -Syu'

# Others.
alias c='clear'
alias ls='eza --all --icons'
alias nv='f() { dir=$(dirname "$1"); if [[ -f "$dir/pyproject.toml" ]]; then poetry run nvim "$@"; else nvim "$@"; fi; }; f'

alias elixirls='$HOME/.elixirls/language_server.sh'

# Set up fzf integrations
eval "$(fzf --zsh)"

# Workaround for fzf-tab to properly work
eval "enable-fzf-tab"

# Enable zoxide for smarter cd
eval "$(zoxide init --cmd cd zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)



# Enables history on the Elixir's iex environment
export ERL_AFLAGS="-kernel shell_history enabled"

# Needed for solving Elixir's iex error https://erlangforums.com/t/sh-1-exec-tty-sl-not-found/2848/2
export PATH=/home/norestraint/.cache/rebar3/bin:$PATH

# Used when theres a need to profile the zsh init logs
# zprof

zstyle ':completion:*' menu select
fpath+=~/.zfunc
fpath+=~/bin

. /usr/local/bin
. "$HOME/.asdf/asdf.sh"
. "$HOME/.cargo/env"
. "$HOME/.asdf/plugins/golang/set-env.zsh"
export PATH=$HOME/bin:$PATH

# bun completions
[ -s "/home/norestraint/.bun/_bun" ] && source "/home/norestraint/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH=/home/norestraint/.cache/rebar3/bin:$PATH

# Created by `pipx` on 2025-02-04 18:53:45
export PATH="$PATH:/home/norestraint/.local/bin"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/norestraint/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/norestraint/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/norestraint/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/norestraint/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# Source Git profile switcher
source "$HOME/dotfiles/git_profile_switcher.zsh"

# Git profile aliases
alias gp="git_profile"
alias gpp="git_profile switch personal"
alias gpw="git_profile switch work"
