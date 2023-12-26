alias nv=nvim
alias nxc='sudo nvim /etc/nixos/configuration.nix'

alias sd="cd \$(find . $HOME | fzf)"
alias cleanup-nixos='nix-collect-garbage && nix-collect-garbage -d'

eval "$(starship init bash)"
