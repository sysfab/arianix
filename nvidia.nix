{ config, nixpkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware = {
        graphics.enable = true;

        nvidia = {
            nvidiaSettings = true;

            powerManagement.enable = true;
            modesetting.enable = true;

            package = config.boot.kernelPackages.nvidiaPackages.stable;
            open = false;
        };
    };
}