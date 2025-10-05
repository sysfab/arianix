{}:

{
    "$mod" = "SUPER";

    bind = [
        "$mod, Q, exec, kitty"
        "$mod, R, exec, pkill wofi || wofi --show drun"
        "$mod, C, killactive"
    ];

    bindm = [          
        "$mod, mouse:272, movewindow"
    ];

    input = {
        "sensitivity" = "-0.5";
    };

    monitor = [
        "HDMI-A-1, 1920x1080@100hz, 0x0, 1"
        "DVI-D-1, 1920x1080@60hz, 1920x0, 1"
    ];
}
