{}:

{
     "$mod" = "SUPER";
     bind = [
          "$mod, Q, exec, kitty"
          "$mod, R, exec, pkill wofi || wofi --drun"
          "$mod, C, killactive"
     ];
}
