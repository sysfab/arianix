{ config, nixpkgs, home-manager, ... }:

{
    users.users.sysfab = {
        isNormalUser = true;
        extraGroups = [ "wheel" "audio" "networkmanager"];
    };

    home-manager.users.sysfab = { pkgs, ... }: {
        home.packages = [
            pkgs.google-chrome
            pkgs.vscode
            pkgs.discord
        ];
    };
}