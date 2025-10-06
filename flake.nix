{
    description = "My NixOS configuration";

    inputs = {
            nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

            home-manager = {
                    url = "github:nix-community/home-manager";
                    inputs.nixpkgs.follows = "nixpkgs";
            };

            nixcord = {
                url = "github:kaylorben/nixcord";
            };
    };


    outputs = inputs@{ self, nixpkgs, home-manager, nixcord, ... }: {
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
                inherit nixpkgs;
                inherit nixcord;
            };
        };
    };
}
