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
    };
}