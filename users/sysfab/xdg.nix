{ pkgs, ... }:

{
    xdg = {
        mimeApps = {
            enable = true;
            defaultApplications = {
                "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
                "x-scheme-handler/http" = [ "google-chrome.desktop" ];
                "x-scheme-handler/https" = [ "google-chrome.desktop" ];
                "text/html" = [ "google-chrome.desktop" ];
            };
        };

        portal = {
            enable = true;
            extraPortals = [ 
                pkgs.xdg-desktop-portal-hyprland
                pkgs.xdg-desktop-portal-wlr
            ];

            config = {
                hyprland = {
                    default = [ "hyprland" ];
                };
            };
        };
    };
}