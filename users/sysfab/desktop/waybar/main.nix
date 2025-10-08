{ ... }:

let
    style = builtins.readFile ./config/style.css;
in
{
    programs.waybar = {
        enable = true;

        settings.text = import ./config/main.nix;
        style = style;

        systemd.enable = false;
    };
}