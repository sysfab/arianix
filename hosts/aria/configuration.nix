{ config, pkgs, ... }:

{
    boot.loader.systemd-boot.enable = true;

    fileSystems."/" = {
        device = "/dev/nvme0n1";
        fsType = "ext4";
    };

    networking.hostName = "aria";

    system.stateVersion = "25.05";
}