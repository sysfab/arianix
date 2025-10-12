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

    programs.steam = {
        enable = true

        protontricks.enable = true
    }

    xdg.icons.enable = true;

    home-manager = {
        extraSpecialArgs = { inherit inputs; };

        users.sysfab = import ./home.nix;
    };
}
