{ config, nixpkgs, home-manager, ... }:

let
    bashrc = builtins.readFile ./.bashrc;

    wofi_css = builtins.readFile ./wofi/style.css;
    swaync_css = builtins.readFile ./swaync/style.css;
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

    home-manager.users.sysfab = { pkgs, ... }: {
        nixpkgs.config.allowUnfree = true;

        home.packages = with pkgs; [
            xwayland
            kitty
            nautilus

            font-awesome

            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-cjk-serif
            noto-fonts-emoji

            google-chrome
            vscode
        ];

        programs.nixcord = {
            enable = true;

            config = {
                plugins = {
                    fakeNitro.enable = true
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

        xdg.portal = {
            enable = true;
            extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

            config = {
                hyprland = {
                    default = [ "hyprland" ];
                };
            };
        };

        programs.bash.enable = true;
        programs.bash.bashrcExtra = bashrc;

        home.stateVersion = "25.05";
    };
}
