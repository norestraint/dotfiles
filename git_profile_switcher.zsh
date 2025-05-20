#!/bin/zsh
# git_profile_switcher.sh
# This script can be sourced in your .zshrc

# Define profiles - use zsh associative array syntax
typeset -A git_profiles
git_profiles[personal]="norestraint@protonmail.com|Jorge Luis|$HOME/.ssh/id_ed25519"
git_profiles[work]="jorge.luis@arqgen.com.br|Jota|$HOME/.ssh/id_ed25519_arqgen"

# Function to list available profiles
git_profile_list() {
  echo "Available Git profiles:"
  for profile in ${(k)git_profiles}; do
    IFS='|' read -r email name ssh_key <<< "${git_profiles[$profile]}"
    if [[ "$profile" == "$(git_profile_current)" ]]; then
      echo "* $profile ($email, $name) [ACTIVE]"
    else
      echo "  $profile ($email, $name)"
    fi
  done
}

# Function to get the current profile
git_profile_current() {
  if [[ -f ~/.git_current_profile ]]; then
    cat ~/.git_current_profile
  else
    echo "none"
  fi
}

# Function to switch profile
git_profile_switch() {
  profile=$1
  
  if [[ -z "$profile" ]]; then
    echo "Error: No profile specified"
    git_profile_list
    return 1
  fi
  
  if [[ -z "${git_profiles[$profile]}" ]]; then
    echo "Error: Profile '$profile' does not exist"
    git_profile_list
    return 1
  fi
  
  IFS='|' read -r email name ssh_key <<< "${git_profiles[$profile]}"
  
  # Set global git config
  eval "$(ssh-agent -s)"
  ssh-agent -s &>/dev/null
  ssh-add -D &>/dev/null
  ssh-add "$ssh_key" &>/dev/null
  git config --global user.email "$email"
  git config --global user.name "$name"
  git config --global core.sshCommand "ssh -i $ssh_key -F /dev/null"
  
  # Save current profile
  echo "$name" > ~/.git_current_profile
  
  echo "Switched to Git profile: $profile"
  echo "Email: $email"
  echo "Name: $name"
  echo "SSH Key: $ssh_key"
}

# Main function for command execution
git_profile() {
  local command="$1"
  shift 2>/dev/null || true
  
  case "$command" in
    list)
      git_profile_list
      ;;
    current)
      echo "Current Git profile: $(git_profile_current)"
      ;;
    switch)
      git_profile_switch "$1"  # Now $1 is the first parameter after shift
      ;;
    *)
      echo "Usage: git_profile [command]"
      echo ""
      echo "Commands:"
      echo "  list                List available Git profiles"
      echo "  current             Show current Git profile"
      echo "  switch <profile>    Switch to specified Git profile"
      echo ""
      git_profile_list
      ;;
  esac
}

# Only execute if the script is being run directly (not sourced)
if [[ "$ZSH_EVAL_CONTEXT" = "toplevel" && "$0" != "-zsh" ]]; then
  git_profile "$@"
fi
