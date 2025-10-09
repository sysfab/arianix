{
    description = "My NixOS configuration";

    inputs = {
            nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

            home-manager = {
                    url = "github:nix-community/home-manager";
                    inputs.nixpkgs.follows = "nixpkgs";
            };

            nixcord.url = "github:kaylorben/nixcord";
            spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    };

    outputs = inputs @ { self, ... }: {
        nixosConfigurations.aria = inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";

            specialArgs = { inherit inputs; };

            modules = [
                inputs.home-manager.nixosModules.home-manager

                ./hosts/aria/configuration.nix

                ./system-packages.nix
                ./nvidia.nix

                ./environment.nix

                ./users/sysfab/main.nix
            ];
        };
    };
}
