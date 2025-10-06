{}:

{
    decoration = {
        "rounding" = "0";
        "rounding_power" = "2";

        "active_opacity" = "1";
        "inactive_opacity" = "1";

        shadow = {
            "enabled" = "true";
            "range" = "4";
            "render_power" = "3";
            "color" = "rgba(1a1a1aee)";
        };

        blur = {
            "enabled" = "true";
            "size" = "1";
            "passes" = "3";

            "vibrancy" = "0.1696";
        };
    };

    windowrulev2 = [
        "opacity 0.8 0.8, class:^(kitty)$"

        "opacity 0.8 0.8, class:^(nautilus)$"
    ];

    layerrule = [
        "ignorealpha 0.1, wofi"
        "blur,wofi"

        "ignorealpha 0.1, waybar"
        "blur,waybar"

        "ignorealpha 0.1, swaync-control-center"
        "blur, swaync-control-center"
    ];
}