{ config, pkgs, lib, ... }:

{
    boot.loader.systemd-boot.enable = true;

    fileSystems."/" = {
        device = "/dev/nvme0n1p2";
        fsType = "ext4";
    };

    fileSystems."/boot" = {
        device = "/dev/nvme0n1p1";
        fsType = "vfat";
    };

    networking.hostName = "aria";
    time.timeZone = "Europe/Kyiv";

    system.stateVersion = "25.05";
}