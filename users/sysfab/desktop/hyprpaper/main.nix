{ ... }:

let
    wallpaper = ./wallpaper.jpg;
in
{
    services.hyprpaper = {
        enable = true;

        settings = {
            ipc = "on";
            splash = false;

            preload = [
                "${wallpaper}"
            ];

            wallpaper = [
                "HDMI-A-1, ${wallpaper}"
                "DVI-D-1, ${wallpaper}"
            ];
        };
    };
}