{ config, pkgs, lib, inputs, ... }:

let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};

    spicy-lyrics = {
        name = "spicy-lyrics";

        
    };
in
{
    programs.spicetify = {
        enable = true;

        enabledExtensions = with spicePkgs.extensions; [
            adblock
            hidePodcasts

            {
                name = "spicy-lyrics";

                src = pkgs.fetchFromGitHub {
                    owner = "Spikerko";
                    repo = "spicy-lyrics";
                    tag = "5.16.2";
                    hash = "sha256-NOYbHYgvPNi4+H+xorTvJekhSpvNakjnzPcyc8fvtPY=";
                };
                path = "src/SpicetifyExtension";
            }
        ];

        enabledCustomApps = with spicePkgs.apps; [
            
        ];

        enabledSnippets = with spicePkgs.snippets; [
            rotatingCoverart
        ];
    };
}