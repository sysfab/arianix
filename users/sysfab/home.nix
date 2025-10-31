{ config, pkgs, lib, inputs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    imports = [
        ./bash/main.nix

        ./xdg.nix

        ./packages.nix

        ./packages/aria/rebuild/main.nix
        ./packages/aria/clear-garbage/main.nix
        ./packages/aria/clear-full/main.nix

        inputs.nixcord.homeModules.nixcord
        ./packages/discord.nix

        inputs.spicetify-nix.homeManagerModules.default
        ./packages/spotify.nix

        ./desktop/hyprland/main.nix
        ./desktop/hyprpaper/main.nix
        ./desktop/wofi/main.nix
        ./desktop/waybar/main.nix
        ./desktop/swaync/main.nix
        ./cursor.nix
    ];

    #services.pulseeffects.enable = true;

    fonts.fontconfig.enable = true;

    home.stateVersion = "25.05";
}