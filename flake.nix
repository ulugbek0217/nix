{
  description = "Enhanced NixOS configuration (flake) for msi";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  }:
  let
    system = "x86_64-linux";
    
    # Create an overlay that adds unstable packages to pkgs
    overlay-unstable = final: prev: {
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    };
  in
  {
    nixosConfigurations = {
      msi = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit
            nixpkgs
            nixpkgs-unstable
            home-manager
          ;
        };
        modules = [
          # Apply the overlay to add pkgs.unstable
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
          ./hosts/msi/configuration.nix
        ];
      };
    };
    
    # Optional: Keep standalone home-manager configuration for testing
    # You can remove this section if you only want to use home-manager through NixOS
    homeConfigurations = {
      ulugbek = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [ overlay-unstable ];
        };
        extraSpecialArgs = {
          inherit
            nixpkgs
            nixpkgs-unstable
          ;
        };
        modules = [
          ./home/ulugbek/home.nix
        ];
      };
    };
  };

}