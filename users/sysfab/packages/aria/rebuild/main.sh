# Thanks 0atman for https://gist.github.com/0atman/1a5133b842f929ba4c1e195ee67599d5

set -e

pushd ~/arianix/

git add .

current=$(nixos-rebuild list-generations --json   | jq -r '.[] | select(.current) | "Build generation #\(.generation)"')

git commit -m "$current"

echo "NixOS Rebuilding..."

sudo nixos-rebuild switch --flake ~/arianix/

popd