#!/bin/bash

editor="lv"

ignored_folders=(
  ".cache" 
  "target" 
  ".cargo" 
  ".config" 
  ".nvm"
  ".local"
  ".git"
)

go_to_folder="find $HOME -type d \( "
go_to_file="find $HOME/ -type f \( "

for folder in "${ignored_folders[@]}"; do
  go_to_folder+="-not -path \"*/$folder*\" -and "
  go_to_file+="-not -path \"*/$folder*\" -and "
done

go_to_folder="${go_to_folder::-5}"
go_to_file="${go_to_file::-5}"

go_to_folder+="\) | fzf"
go_to_file+="\) | fzf"

alias lv="$HOME/.local/bin/lvim"

# Go to folder
alias gd='dir=$(eval "$go_to_folder"); if [[ -n "$dir" ]]; then cd "$dir"; fi'

# Load folder into editor
alias ld='dir=$(eval "$go_to_folder"); if [[ -n "$dir" ]]; then $editor "$dir"; fi'

# Load file into editor
alias lf='file=$(eval "$go_to_file"); if [[ -n "$file" ]]; then $editor "$file"; fi'

