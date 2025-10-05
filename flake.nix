{
    description = "My NixOS configuration";

    inputs = {
            nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

            home-manager = {
                    url = "github:nix-community/home-manager";
                    inputs.nixpkgs.follows = "nixpkgs";
            };
    };


    outputs = { self, nixpkgs, home-manager, ... }@inputs: {
        nixpkgs.config.allowUnfree = true;

        nixosConfigurations.aria = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";

            modules = [
                ./hosts/aria/configuration.nix
                ./nvidia.nix
                ./system-packages.nix
            ];
        };
    };
}