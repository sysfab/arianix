{ config, nixpkgs, home-manager, ... }:

let
    bashrc = builtins.readFile ./.bashrc;

    wofi_css = builtins.readFile ./wofi/style.css;
    swaync_css = builtins.readFile ./swaync/style.css;

    nautEnv = nixpkgs.buildEnv {
        name = "nautilus-env";

        paths = with nixpkgs; [
            gnome.nautilus
            gnome.nautilus-python
            nautilus-open-any-terminal
        ];
    };
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

    programs.hyprland.enable = true;
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
            xwayland
            kitty
            nautEnv
            hyprshot

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
        ];

        home.sessionVariables = {
            GIO_EXTRA_MODULES = "${nautEnv}/lib/gio/modules";
            NAUTILUS_4_EXTENSION_DIR = "${nautEnv}"; # https://github.com/NixOS/nixpkgs/blob/98da3dd0de6660d4abed7bb74e748694bd803413/pkgs/desktops/gnome/core/nautilus/extension_dir.patch#L18
        };

        programs.nixcord = {
            enable = true;

            config = {
                plugins = {
                    fakeNitro.enable = true;

                    platformIndicators.enable = true;

                    plainFolderIcon.enable = true;

                    disableCallIdle.enable = true;

                    callTimer.enable = true;

                    messageLogger.enable = true;

                    clientTheme = {
                        enable = true;

                        color = "23283d";
                    };

                    pinDMs.enable = true;
                };
            };
        };
        
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
            settings = import ./hyprland/main.nix {};
        };

        services.swaync = {
            enable = true;

            style = swaync_css;
            settings.source = ./swaync/config.json;
        };

        services.hyprpaper = {
            enable = true;

            settings = {
                ipc = "on";
                splash = false;

                preload = [
                    "${./hyprpaper/wallpaper.jpg}"
                ];

                wallpaper = [
                    "HDMI-A-1, ${./hyprpaper/wallpaper.jpg}"
                    "DVI-D-1, ${./hyprpaper/wallpaper.jpg}"
                ];
            };
        };

        home.file.".config/waybar/config".source = ./waybar/config;
        home.file.".config/waybar/style.css".source = ./waybar/style.css;

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

        programs.bash.enable = true;
        programs.bash.bashrcExtra = bashrc;

        home.stateVersion = "25.05";
    };
}
