{ config, pkgs, lib, inputs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    imports = [
        ./packages.nix
        ./bash/main.nix

        ./xdg.nix

        inputs.nixcord.homeModules.nixcord
        ./apps/discord.nix

        inputs.spicetify-nix.homeManagerModules.default
        ./apps/spotify.nix

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