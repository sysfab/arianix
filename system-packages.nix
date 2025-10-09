{ config, pkgs, lib, inputs, ... }:

{
    programs.nix-ld.enable = true;

    environment.systemPackages = with pkgs; [
        wget
        curl
        git
        htop
    ];

    programs.bash.enable = true;

    services.libinput.enable = true;

    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;

        alsa.enable = true;

        pulse.enable = true;

        jack.enable = true;

        extraConfig = {
            pipewire."99-silent-bell.conf" = {
                "context.properties" = {
                    "module.x11.bell" = false;
                };
            };
        };
    };

    security.polkit.enable = true;
    systemd = {
        user.services.polkit-gnome-authentication-agent-1 = {
            description = "polkit-gnome-authentication-agent-1";
            wantedBy = [ "graphical-session.target" ];
            wants = [ "graphical-session.target" ];
            after = [ "graphical-session.target" ];
            serviceConfig = {
                Type = "simple";
                ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
                Restart = "on-failure";
                RestartSec = 1;
                TimeoutStopSec = 10;
            };
        };
    };
}