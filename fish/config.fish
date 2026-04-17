alias ls="eza -G --icons=always"

set EDITOR nvim

starship init fish | source

zoxide init fish | source

fish_add_path -g "$HOME/bin"

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish
