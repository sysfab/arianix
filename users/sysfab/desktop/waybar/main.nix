{ ... }:

let
    settings = ./config/config;
    style = builtins.readFile ./config/style.css;
in
{
    programs.waybar = {
        enable = true;

        settings.source = settings;
        style = style;

        systemd.enable = false;
    };
}