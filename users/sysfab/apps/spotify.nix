{ config, pkgs, lib, inputs, ... }:

let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};

    spicy-lyrics = {
        name = "spicy-lyrics";

        src = pkgs.fetchFromGitHub {
            owner = "Spikerko";
            repo = "spicy-lyrics";
        };
    };
in
{
    programs.spicetify = {
        enable = true;

        enabledExtensions = with spicePkgs.extensions; [
            adblock
            hidePodcasts
        ];

        enabledCustomApps = with spicePkgs.apps; [
            spicy-lyrics
        ];

        enabledSnippets = with spicePkgs.snippets; [
            rotatingCoverart
        ];
    };
}