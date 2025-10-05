{ config, nixpkgs, home-manager, ... }:

let
    bashrc = builtins.readFile ./.bashrc;
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

    home-manager.users.sysfab = { pkgs, ... }: {
        nixpkgs.config.allowUnfree = true;

        home.packages = with pkgs; [
            hyprland
            xwayland
            wofi
            kitty
            waybar
            nautilus

            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-cjk-serif

            noto-fonts-emoji

            google-chrome
            vscode
            discord
        ];

        xdg.portal = {
            enable = true;
            extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
        };

        programs.bash.enable = true;
        programs.bash.bashrcExtra = bashrc;

        home.stateVersion = "25.05";
    };
}