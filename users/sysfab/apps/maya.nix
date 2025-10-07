{ pkgs ? import <nixpkgs> {} }:

pkgs.buildFHSEnv {
  name = "maya-env";
  targetPkgs = pkgs: with pkgs; [
    alsa-lib
    fontconfig
    freetype
    libGLU
    zlib
    openssl
    curl
  ];
  runScript = "bash";
}