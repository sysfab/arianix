{ config, pkgs, lib, inputs, ... }:

{
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    
    programs.nix-ld.enable = {
        enable = true;
        libraries = with pkgs; [
            zlib zstd stdenv.cc.cc curl openssl attr libssh bzip2 libxml2 acl libsodium util-linux xz systemd
        ];

        environment.systemPackages = [
            (pkgs.writeShellScriptBin "python" ''
                export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH
                exec ${pkgs.python3}/bin/python "$@"
            '')
        ];
    };

    services.zerotierone = {
        enable = true;
        joinNetworks = [
            "93afae5963737628"
        ];
    };

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