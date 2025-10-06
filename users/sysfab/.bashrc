alias aria-rebuild='cd ~/arianix; git add .; git commit -m "update: rebuild"; sudo nixos-rebuild switch --flake ~/arianix/'


PS1='\[\e[38;5;33m\][\u@\h:\[\e[38;5;39m\]\w\[\e[38;5;33m\]]\$\[\e[0m\] '