{
  description = "Enhanced NixOS configuration (flake) for msi";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  }:
  {
      nixosConfigurations = {
        msi = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit
              nixpkgs
              nixpkgs-unstable
              home-manager
              ;
            unstable = import nixpkgs-unstable {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
            stable = import nixpkgs {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
          };
          modules = [
            ./hosts/msi/configuration.nix
          ];
        };
      };
      homeConfigurations = {
        ulugbek = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {
            inherit
              nixpkgs
              nixpkgs-unstable
              ;
            unstable = import nixpkgs-unstable {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
            stable = import nixpkgs {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
          };
          modules = [
            ./home/ulugbek/home.nix
          ];
        };
      };
  };

}