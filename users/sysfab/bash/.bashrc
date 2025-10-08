alias aria-gc='nix-env --delete-generations old; sudo nix-collect-garbage -d'
alias aria-rebuild='cd ~/arianix; git add .; git commit -m "update: rebuild"; sudo nixos-rebuild switch --flake ~/arianix/'
alias aria-clear='sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +3; aria-gc'

PS1='\[\e[38;5;33m\][\u@\h:\[\e[38;5;39m\]\w\[\e[38;5;33m\]]\$\[\e[0m\] '