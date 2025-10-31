# Thanks 0atman for https://gist.github.com/0atman/1a5133b842f929ba4c1e195ee67599d5

set -e

pushd ~/arianix/

# Early return if no changes were detected (thanks @singiamtel!)
if git diff --quiet '*.nix'; then
    echo "No changes detected, exiting."
    popd
    exit 0
fi

git diff -U0 '*.nix'

git add .
current=$(nixos-rebuild list-generations | grep current)
git commit -m "$current"

echo "NixOS Rebuilding..."

sudo nixos-rebuild switch --flake ~/arianix/

popd

notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available