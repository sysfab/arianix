{ config, nixpkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        wget
        curl
        git

        hyprland
        waybar
        wofi
        pavucontrol
        kitty
        nautilus
    ];

    programs.bash.enable = true;

    services.libinput.enable = true;

    services.pipewire = {
        enable = true;

        alsa.enable = true;
        alsa.support32Bit = true;

        pulse.enable = true;

        jack.enable = true;

        extraConfig = {
            pipewire."99-silent-bell.conf" = {
                "context.properties" = {
                    "module.x11.bell" = fa>
                };
            }
        };
    };
}