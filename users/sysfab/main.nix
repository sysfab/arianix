{ config, nixpkgs, home-manager, hyprland, ... }:

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

    programs.hyprland = {
        enable = true;
    };

    home-manager.users.sysfab = { pkgs, ... }: {
        nixpkgs.config.allowUnfree = true;

        home.packages = with pkgs; [
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

        wayland.windowManager.hyprland = {
            enable = true;
            settings = import ./hyprland/main.nix { inherit settings; };
        };

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
