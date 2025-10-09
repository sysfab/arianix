{ config, pkgs, lib, inputs, ... }:

{
    programs.nixcord = {
        enable = true;

        package = pkgs.nixcord;

        flags = [ "--enable-features=WebRTCPipeWireCapturer" ];

        config = {
            plugins = {
                fakeNitro.enable = true;

                platformIndicators.enable = true;

                plainFolderIcon.enable = true;

                disableCallIdle.enable = true;

                callTimer.enable = true;

                messageLogger.enable = true;

                clientTheme = {
                    enable = true;

                    color = "23283d";
                };

                pinDMs.enable = true;
            };
        };
    };
}