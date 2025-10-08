{ ... }:

let
    style = builtins.readFile ./config/style.css;
in
{
    services.swaync = {
        enable = true;

        style = style;
        settings.source = ./config/config.json;
    };
}