{}:

{
     "$mod" = "SUPER";
     bind = [
          "$mod, Q, exec, kitty"
          "$mod, R, exec, pkill wofi || wofi --show drun"
          "$mod, C, killactive"
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
     ];
}
