{}:

{
    exec-once = [
        "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"
        "gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'"

        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP && systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    
        "$bar"
    ];
}