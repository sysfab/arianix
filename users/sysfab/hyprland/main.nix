{}:

let
    binds = import ./binds.nix { };
in
{
    "$mod" = "SUPER";

    inherit (binds) bind bindm;

    input = {
        "sensitivity" = "-0.5";
    };

    monitor = [
        "HDMI-A-1, 1920x1080@100hz, 0x0, 1"
        "DVI-D-1, 1920x1080@60hz, 1920x0, 1"
    ];
}
