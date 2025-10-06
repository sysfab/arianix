{ config, nixpkgs, home-manager, ... }:

let
    bashrc = builtins.readFile ./.bashrc;
    bash_profile = builtins.readFile ./.bash_profile;

    wofi_css = builtins.readFile ./desktop/wofi/style.css;
    swaync_css = builtins.readFile ./desktop/swaync/style.css;
in
{
    nixpkgs.config.allowUnfree = true;

    users.users.sysfab = {
        isNormalUser = true;
        extraGroups = [
            "wheel"
            "audio"
            "networkmanager"
        ];
    };

    xdg.icons.enable = true;
    programs.steam.enable = true;

    home-manager.users.sysfab = { pkgs, ... }: {
        nixpkgs.config.allowUnfree = true;

        home.pointerCursor = {
            enable = true;
            package = pkgs.vimix-cursors;
            name = "Vimix-cursors";
            size = 24;
            gtk.enable = true;
        };

        home.packages = with pkgs; [
            hyprland
            xwayland
            kitty
            gvfs
            nautilus
            hyprshot

            cmatrix
            fastfetch

            adw-gtk3

            adwaita-icon-theme
            papirus-icon-theme
            gnome-themes-extra

            font-awesome

            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-cjk-serif
            noto-fonts-emoji

            google-chrome
            vscode
            prismlauncher
        ];

        programs.bash = {
            enable = true;
            bashrcExtra = bashrc;
            initExtra = bash_profile;
        };

        programs.nixcord = import ./apps/discord.nix {};
        
        fonts.fontconfig.enable = true;

        programs.waybar = {
            enable = true;
            systemd.enable = false;
        };

        programs.wofi = {
            enable = true;

            style = wofi_css;
            settings = {
                mode = "drun";
                insensitive = true;
                prompt = "Search";
                term = "kitty";
            };
        };

        wayland.windowManager.hyprland = {
            enable = true;
            settings = import ./desktop/hyprland/main.nix {};
        };

        services.swaync = {
            enable = true;

            style = swaync_css;
            settings.source = ./desktop/swaync/config.json;
        };

        services.hyprpaper = {
            enable = true;

            settings = {
                ipc = "on";
                splash = false;

                preload = [
                    "${./desktop/hyprpaper/wallpaper.jpg}"
                ];

                wallpaper = [
                    "HDMI-A-1, ${./desktop/hyprpaper/wallpaper.jpg}"
                    "DVI-D-1, ${./desktop/hyprpaper/wallpaper.jpg}"
                ];
            };
        };

        home.file.".config/waybar/config".source = ./desktop/waybar/config;
        home.file.".config/waybar/style.css".source = ./desktop/waybar/style.css;

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
                extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

                config = {
                    hyprland = {
                        default = [ "hyprland" ];
                    };
                };
            };
        };

        home.stateVersion = "25.05";
    };
}
