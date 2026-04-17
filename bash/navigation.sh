#!/bin/bash
ignored_folders=(
  ".cache"
  ".asdf"
  ".pyenv"
  ".bun"
  "deps"
  "target"
  ".cargo"
  ".config"
  ".nvm"
  ".local"
  ".git"
  "node_modules"
  "go"
  ".rustup"
  ".var"
  "obsidian"
  ".logseq"
  ".mozilla"
  "miniconda3"
  ".vscode"
)

# Start building the find command with prune expressions
go_to_folder="find $HOME"
go_to_file="find $HOME"

# Add prune expressions for each ignored folder
for folder in "${ignored_folders[@]}"; do
  go_to_folder="$go_to_folder -path '*/$folder' -prune -o -path '*/$folder/*' -prune -o"
  go_to_file="$go_to_file -path '*/$folder' -prune -o -path '*/$folder/*' -prune -o"
done

# Complete the commands with type conditions
go_to_folder="$go_to_folder -type d -print | fzf"
go_to_file="$go_to_file -type f -print | fzf"

alias nv='nvim'

# Go to folder
alias gd='dir=$(eval "$go_to_folder"); if [[ -n "$dir" ]]; then cd "$dir"; fi'
# Load folder into editor
alias ld='dir=$(eval "$go_to_folder"); if [[ -n "$dir" ]]; then cd "$dir" && nv . ; fi'
# Load file into editor
alias lf='file=$(eval "$go_to_file"); if [[ -n "$file" ]]; then nv "$file"; fi'
