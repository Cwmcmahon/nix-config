{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # river-bedload
    river-bedload = {
      url = "/home/carterm/Documents/nix-config/pkgs/river-bedload";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    filtile = {
      url = "github:pkulak/filtile";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { nixpkgs, home-manager, river-bedload, ... }@inputs: 
    let
      system = "x86_64-linux";
    in
    {
      # NixOS configuration entrypoint
      nixosConfigurations = {
        samsung = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./nixos/hosts/samsung.nix
            {
              nixpkgs.overlays = [
                (final: prev: {
                  filtile = inputs.filtile.packages.${system}.filtile;
                })
              ];
              environment.systemPackages = [
                inputs.river-bedload.packages.${system}.default
              ];
            }
          ];
        };

        dell = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./nixos/hosts/dell.nix
            {
              environment.systemPackages = [
                inputs.river-bedload.packages.${system}.default
              ];
            }
          ];
        };
      };

      # Standalone home-manager configuration entrypoint
      homeConfigurations = {
        carterm = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.${system};
            extraSpecialArgs = { inherit inputs; };
            modules = [ 
              ./home-manager/home.nix
            ];
        };
     };
  };
}
