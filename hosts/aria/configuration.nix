{ config, pkgs, ... }:

{
    boot.loader.systemd-boot.enable = true;
    networking.hostName = "aria";
}