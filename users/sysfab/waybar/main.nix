{}:

{
    enable = true;

    style = builtins.readFile ./style.css;
    
    settings = [
        {
            "layer" = "top";

            "margin-top" = 0;
            "margin-bottom" = 0;
            "margin-left" = 0;
            "margin-right" = 0;
            "spacing" = 0;

            "height" = 42;

            "clock" = {
                "format" = "{:%H:%M:%S}";
                "format-alt" = "{:%A, %B %d, %Y}";
                "tooltip-format" = "<tt><small>{calendar}</small></tt>";
                "interval" = 1;
            };

            "hyprland/language" = {
                "format" = "{}";
                "format-en" = "";
                "format-uk" = "";
            };

            "tray" = {
                "spacing" = 10;
                "show-passive-items" = true;
            };

            "custom/notification" = {
                "tooltip" = false;
                "format" = "{icon}";
                "format-icons" = {
                    "notification" = "<span></span>";
                    "none" = "<span></span>";
                    "dnd-notification" = "<span></span>";
                    "dnd-none" = "<span></span>";
                },
                "return-type" = "json";
                "exec" = "swaync-client -swb";
                "on-click" = "swaync-client -t -sw";
                "on-click-right" = "swaync-client -d";
                "escape" = true
            };

            "custom/power": {
                "format" = "";
                "tooltip" = "false";
                "on-click" = "exec bash ~/.config/fabarch/wlogout/launch.sh";
                "interval" = "once";
            };


            "modules-left" = [
                "tray"
                "hyprland/language"
            ];

            "modules-center" = [
                "clock"
            ];

            "modules-right" = [
                "custom/notification"
                "custom/power"
            ];
        }
    ]
}