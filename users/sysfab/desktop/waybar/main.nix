{ ... }:

let
    settings = builtins.readFile .config/config;
    style = builtins.readFile .config/style.css;
in
{
    programs.waybar = {
        enable = true;

        settings = settings;
        style = style;

        systemd.enable = false;
    };
}