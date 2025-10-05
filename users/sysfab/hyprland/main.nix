{}:

let
    inputs = import ./inputs.nix {};
    monitors = import ./monitors.nix {};
in
{
    "$mod" = "SUPER";

    inherit (inputs) input bind bindm;
    inherit (monitors) monitor;
}
