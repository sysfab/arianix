{ config, pkgs, lib, inputs, ... }:

let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
    programs.spicetify = {
        enable = true;

        enabledExtensions = with spicePkgs.extensions; [
            adblock
            hidePodcasts
        ];

        enabledCustomApps = with spicePkgs.apps; [
            marketplace
        ];

        enabledSnippets = with spicePkgs.snippets; [
            rotatingCoverart
        ];
    };
}