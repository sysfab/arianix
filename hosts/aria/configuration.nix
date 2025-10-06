{ config, pkgs, lib, ... }:

{
    boot = {
        loader = {
            systemd-boot.enable = true;
        };

        kernelParams = [ "quiet" "loglevel=3" "systemd.show_status=false" ];
    };

    environment.etc."issue".text = "";
    services.getty.helpLine = "Welcome to Aria!";
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

    fileSystems."/mnt/windows" = {
        device = "/dev/disk/by-uuid/D8E60AFDE60ADC1E";
        fsType = "ntfs";
        options = [ "rw" "uid=1000" "gid=100" "umask=0022" ];
    };

    networking.hostName = "aria";
    time.timeZone = "Europe/Kyiv";

    system.stateVersion = "25.05";
}