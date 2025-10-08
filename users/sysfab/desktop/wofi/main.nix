{ ... }:

let
    style = ./style.css;
in
{
    programs.wofi = {
        enable = true;

        style = style;
        settings = {
            mode = "drun";
            insensitive = true;
            prompt = "Search";
            term = "kitty";
        };
    }; 
}