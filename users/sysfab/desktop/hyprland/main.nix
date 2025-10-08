{ ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        settings = import ./config/main.nix {};
    };
}