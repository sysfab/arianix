{ config, nixpkgs, home-manager, hyprland, ... }:

let
    bashrc = builtins.readFile ./.bashrc;

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
    programs.waybar.enable = true;

    home-manager.users.sysfab = { pkgs, ... }: {
        nixpkgs.config.allowUnfree = true;

        home.packages = with pkgs; [
            xwayland
            wofi
            kitty
            nautilus

            font-awesome

            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-cjk-serif
            noto-fonts-emoji

            google-chrome
            vscode
            discord
        ];
        
        fonts.fontconfig.enable = true;

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

            ipc = true;
            settings = {
                preload = [
                    "./hyprpaper/wallpaper.jpg"
                ];

                wallpaper = [
                    "HDMI-A-1, ./hyprpaper/wallpaper.jpg"
                    "DVI-D-1, ./hyprpaper/wallpaper.jpg"
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
