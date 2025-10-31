{ config, pkgs, lib, inputs, ... }:

let
    scriptContent = builtins.readFile ./main.sh;
    script = pkgs.writeShellScriptBin "aria-clear-full" scriptContent;
in {
    home.packages = [
        script
    ];
}