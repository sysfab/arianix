{ config, pkgs, lib, inputs, ... }:

let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
    programs.spicetify = {
        enable = true;
    }
}