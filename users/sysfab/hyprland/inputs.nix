{}:

{
    "$mod" = "SUPER";

    input = {
        "sensitivity" = "-0.5";
    };

    bind = [
        "$mod, Q, exec, $terminal"
        "$mod, R, exec, $menu"
        "$mod, E, exec, $file-manager"
        "$mod, C, killactive"
    ];

    bindm = [          
        "$mod, mouse:272, movewindow"
    ];
}