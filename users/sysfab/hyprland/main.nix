{}:

let
    inputs = import ./inputs.nix {};
    monitors = import ./monitors.nix {};
in
lib.attrsets.recursiveUpdate inputs monitors