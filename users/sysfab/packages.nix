{ pkgs, ... }:

{
    home.packages = with pkgs; [
        xwayland
        kitty
        gvfs
        nautilus
        hyprshot

        cmatrix
        fastfetch

        adw-gtk3

        adwaita-icon-theme
        papirus-icon-theme
        gnome-themes-extra

        font-awesome

        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-emoji

        uv

        google-chrome
        vscode
        prismlauncher
        heroic
        lmstudio
    ];
}