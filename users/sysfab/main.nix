{ config, pkgs, lib, inputs, ... }:

{
    users.users.sysfab = {
        isNormalUser = true;
        extraGroups = [
            "wheel"
            "audio"
            "networkmanager"
        ];
    };

    programs.steam.enable = true;
    xdg.icons.enable = true;

    home-manager.users.sysfab = import ./home.nix { inherit inputs; inherit pkgs; };
}
