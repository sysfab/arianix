{ pkgs, ... }:

{
    home.packages = with pkgs; [
        xwayland
        kitty
        gvfs
        nautilus
        hyprshot
        pavucontrol

        adw-gtk3

        adwaita-icon-theme
        papirus-icon-theme
        gnome-themes-extra

        uv
        
        jq

        google-chrome
        vscode
        prismlauncher
        heroic
        lmstudio
        coppwr
        #ventoy-full-gtk
        krita
        obsidian
        love
        osu-lazer-bin
        r2modman

        vesktop
    ];

    nixpkgs.config.permittedInsecurePackages = [ "ventoy-gtk3-1.1.07" ];
}