source /usr/share/cachyos-fish-config/cachyos-config.fish

set EDITOR nvim

starship init fish | source

zoxide init fish | source

# fish_add_path -g "$HOME/bin"

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish
~/.local/bin/mise activate fish | source

source "$HOME/.cargo/env.fish"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

fish_add_path "/home/norestraint/.dotnet/tools"
