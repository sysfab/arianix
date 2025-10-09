{ config, pkgs, lib, inputs, ... }:

{
    nixpkgs.config.allowUnfree = true;
    home.stateVersion = "25.05";

    fonts.fontconfig.enable = true;

    imports = [
        inputs.spicetify-nix.homeManagerModules.default

        ./packages.nix
        ./bash/main.nix

        ./xdg.nix

        ./apps/discord.nix
        ./apps/spotify.nix

        ./desktop/hyprland/main.nix
        ./desktop/hyprpaper/main.nix
        ./desktop/wofi/main.nix
        ./desktop/waybar/main.nix
        ./desktop/swaync/main.nix
        ./cursor.nix
    ];

    specialArgs = { inherit inputs; };
}