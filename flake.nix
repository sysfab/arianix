{
    description = "My NixOS configuration";

    inputs = {
            nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

            hyprland.url = "github:hyprwm/Hyprland";

            home-manager = {
                    url = "github:nix-community/home-manager";
                    inputs.nixpkgs.follows = "nixpkgs";
            };
    };


    outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs: {
        nixosConfigurations.aria = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";

            modules = [
                home-manager.nixosModules.home-manager 

                ./hosts/aria/configuration.nix
                ./nvidia.nix

                ./environment.nix
                
                ./system-packages.nix

                ./users/sysfab/main.nix
            ];

            specialArgs = {
                inherit hyprland;
                inherit nixpkgs;
            };
        };
    };
}
