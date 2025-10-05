{}:

let
    programs = import ./programs.nix {};
    inputs = import ./inputs.nix {};
    monitors = import ./monitors.nix {};
in
inputs // 
monitors