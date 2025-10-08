{ ... }:

let
    settings = builtins.readFile ./config/config;
    style = builtins.readFile ./config/style.css;
in
{
    programs.waybar = {
        enable = true;

        settings.text = settings;
        style = style;

        systemd.enable = false;
    };
}