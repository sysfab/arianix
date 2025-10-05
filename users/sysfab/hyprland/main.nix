{}:

let
    programs = import ./programs.nix {};
    inputs = import ./inputs.nix {};
    monitors = import ./monitors.nix {};
in
programs //
inputs // 
monitors