{}:

let
    env = import ./env.nix {};
    programs = import ./programs.nix {};
    inputs = import ./inputs.nix {};
    monitors = import ./monitors.nix {};
    misc = import ./misc.nix {};

    animations = import ./look/animations.nix {};
in
env //
programs //
inputs // 
monitors //
misc //
animations