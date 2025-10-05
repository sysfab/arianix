{ config, pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        wget
        curl
        git
    ];

    programs.bash.enable = true;

    services.libinput.enable = true;

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
}