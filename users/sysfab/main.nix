{ config, nixpkgs, home-manager, ... }:

{
    nixpkgs.config.allowUnfree = true;

    users.users.sysfab = {
        isNormalUser = true;
        extraGroups = [
            "wheel"
            "audio"
            "networkmanager"
        ];
    };

    home-manager.users.sysfab = { pkgs, ... }: {
        nixpkgs.config.allowUnfree = true;

        home.packages = with pkgs; [
            google-chrome
            vscode
            discord
        ];

        programs.bash.enable = true;
        programs.bash.bashrcExtra = builtins.readFile .bashrc;

        home.stateVersion = "25.05";
    };
}