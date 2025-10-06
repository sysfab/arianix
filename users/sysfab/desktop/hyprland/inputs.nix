{}:

{
    "$mainMod" = "SUPER";

    input = {
        "kb_layout" = "us, ua";
        "kb_variant" = "";
        "kb_model" = "";
        "kb_options" = "grp:alt_shift_toggle";
        "kb_rules" = "";

        "follow_mouse" = "1";
        "sensitivity" = "-0.5";
    };

    bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, R, exec, $menu"

        "$mainMod, C, killactive,"
        "$mainMod, V, togglefloating,"
        "$mainMod, J, togglesplit"

        ", PRINT, exec, hyprshot -m region --freeze"
        "SHIFT, PRINT, exec, hyprshot -m output --freeze"
        "$mainMod, PRINT, exec, hyprshot -m window --freeze"

        "$mainMod SHIFT, B, exec, $bar"

        "$mainMod, left, movewindow, l"
        "$mainMod, right, movewindow, r"
        "$mainMod, up, fullscreen, 1"
        "$mainMod, down, fullscreen, 2"

        "$mainMod SHIFT, right, movecurrentworkspacetomonitor, +1"
        "$mainMod SHIFT, left, movecurrentworkspacetomonitor, -1"
    
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
    ];

    bindm = [          
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
    ];
}