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

    impermanence.url = "github:nix-community/impermanence";

		# Shameless plug: looking for a way to nixify your themes and make
		# everything match nicely? Try nix-colors!
		# nix-colors.url = "github:misterio77/nix-colors";
	};

	outputs = { nixpkgs, home-manager, impermanence, ... }@inputs: {
		# NixOS configuration entrypoint
		# Available through 'nixos-rebuild --flake .#your-hostname'
		nixosConfigurations = {
			cwm-nixos = nixpkgs.lib.nixosSystem {
				specialArgs = { inherit inputs; };
				modules = [
					./nixos/hosts/cwm-nixos.nix 
				];
			};

      dell-nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          impermanence.nixosModules.impermanence
          ./nixos/hosts/dell-nixos.nix
        ];
      };
		};

		# Standalone home-manager configuration entrypoint
		# Available through 'home-manager --flake .#your-username@your-hostname'
		homeConfigurations = {
      "carterm@cwm-nixos" = home-manager.lib.homeManagerConfiguration {
	  			pkgs = nixpkgs.legacyPackages.x86_64-linux;
	  			extraSpecialArgs = { inherit inputs; };
	  			modules = [ 
	  				./home-manager/home.nix
	  			];
	  	};
      
      "carterm@dell-nixos" = home-manager.lib.homeManagerConfiguration {
	  			pkgs = nixpkgs.legacyPackages.x86_64-linux;
	  			extraSpecialArgs = { inherit inputs; };
	  			modules = [ 
	  				./home-manager/home.nix
	  			];
	  	};
    };
	};
}
