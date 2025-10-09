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

    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;

        extraSpecialArgs = { inherit inputs; };

        users.sysfab = import ./home.nix;
    };
}
