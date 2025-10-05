{}:

let
    env = import ./env.nix {};
    programs = import ./programs.nix {};
    inputs = import ./inputs.nix {};
    monitors = import ./monitors.nix {};
    misc = import ./misc.nix {};
in
env //
programs //
inputs // 
monitors //
misc