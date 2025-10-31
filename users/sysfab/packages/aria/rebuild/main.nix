{ config, pkgs, lib, inputs, ... }:

let
    scriptContent = builtins.readFile ./main.sh;
    script = pkgs.writeShellScriptBin "aria-rebuild" scriptContent;
in {
    home.packages = [
        script
    ];
}