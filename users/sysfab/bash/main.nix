{ pkgs, ... }:

let
    bashrc = builtins.readFile ./.bashrc;
    bash_profile = builtins.readFile ./.bash_profile;
in
{
    programs.bash = {
        enable = true;
        bashrcExtra = bashrc;
        initExtra = bash_profile;
    };
}