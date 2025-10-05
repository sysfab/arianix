{}:

let
    inputs = import ./inputs.nix {};
    monitors = import ./monitors.nix {};
in
{
    "$mod" = "SUPER";

    inputs;
    monitors;
}