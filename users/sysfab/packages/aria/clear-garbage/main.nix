{ config, pkgs, lib, inputs, ... }:

let
    scriptContent = builtins.readFile ./main.sh;
    script = pkgs.writeShellScriptBin "aria-clear-garbage" scriptContent;
in {
    home.packages = [
        script
    ];
}