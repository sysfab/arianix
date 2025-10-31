{ config, pkgs, lib, inputs, ... }:

{
    home.packages = with pkgs; [
        font-awesome
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-color-emoji
    ];

    fonts.fontconfig.enable = true;
}