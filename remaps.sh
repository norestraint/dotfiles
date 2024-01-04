alias nv=nvim
alias nxc='sudo nvim /etc/nixos/configuration.nix'

alias sd="cd \$(find . $HOME | fzf)"
alias cleanup-nixos='sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo nixos-rebuild switch'

eval "$(starship init bash)"
