{ config, pkgs, lib, inputs, ... }:

let
    scriptContent = builtins.readFile ./main.sh;
in {
    home.packages = [
        pkgs.writeShellScriptBin "aria-rebuild" scriptContent
    ];
}