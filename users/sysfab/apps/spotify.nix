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

            {
                src = (pkgs.fetchFromGitHub {
                    owner = "Spikerko";
                    repo = "spicy-lyrics";
                    tag = "5.16.2";
                    hash = "sha256-NOYbHYgvPNi4+H+xorTvJekhSpvNakjnzPcyc8fvtPY=";
                });

                name = "src/app.tsx";
            }
        ];

        enabledCustomApps = with spicePkgs.apps; [
            
        ];

        enabledSnippets = with spicePkgs.snippets; [
            rotatingCoverart
        ];
    };
}