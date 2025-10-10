{ config, pkgs, lib, inputs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    boot = {
        loader = {
            grub = {
                enable = true;
                efiSupport = true;
                device = "nodev";            
            };
        };

        kernelParams = [
            "quiet"
            "loglevel=3"
            "systemd.show_status=false"
        ];

        initrd.verbose = false;
    };

    environment.etc."issue".text = "";
    services.getty.helpLine = "";
    environment.etc."motd".text = "";
    
    fileSystems."/" = {
        device = "/dev/nvme0n1p2";
        fsType = "ext4";
    };

    fileSystems."/boot" = {
        device = "/dev/nvme0n1p1";
        fsType = "vfat";
    };
    
    fileSystems."/mnt/data" = {
        device = "/dev/disk/by-uuid/d6524d20-622b-417a-97c0-16a9cf867c75";
        fsType = "ext4";
        options = [ "defaults" ];
    };

    networking.hostName = "aria";
    networking.networkmanager.enable = true;
    networking.dhcpcd.enable = false;
    networking.firewall.enable = false;

    services.logrotate.enable = false;


    time.timeZone = "Europe/Kyiv";

    system.stateVersion = "25.05";
}
