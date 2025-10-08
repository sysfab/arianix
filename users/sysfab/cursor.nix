{ pkgs, ... }:

{
    home.pointerCursor = {
        enable = true;
        package = pkgs.vimix-cursors;
        name = "Vimix-cursors";
        size = 24;
        gtk.enable = true;
    };
}