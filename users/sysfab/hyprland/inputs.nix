{}:

{
    input = {
        "sensitivity" = "-0.5";
    };

    bind = [
        "$mod, Q, exec, kitty"
        "$mod, R, exec, pkill wofi || wofi --show drun"
        "$mod, C, killactive"
    ];

    bindm = [          
        "$mod, mouse:272, movewindow"
    ];
}