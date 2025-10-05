{}:

let
    inputs = import ./inputs.nix {};
    monitors = import ./monitors.nix {};
in
inputs // 
monitors