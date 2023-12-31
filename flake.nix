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

		# AGS
		ags.url = "github:Aylur/ags";

		# Shameless plug: looking for a way to nixify your themes and make
		# everything match nicely? Try nix-colors!
		# nix-colors.url = "github:misterio77/nix-colors";
	};

	outputs = { nixpkgs, home-manager, ... }@inputs: {
		# NixOS configuration entrypoint
		# Available through 'nixos-rebuild --flake .#your-hostname'
		nixosConfigurations = {
			cwm-nixos = nixpkgs.lib.nixosSystem {
				specialArgs = { inherit inputs; }; # Pass flake inputs to our config
				# > Our main nixos configuration file <
				modules = [
					./nixos/configuration.nix 
				];
			};
		};

		# Standalone home-manager configuration entrypoint
		# Available through 'home-manager --flake .#your-username@your-hostname'
		homeConfigurations."carterm@cwm-nixos" = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
				extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config
				# > Our main home-manager configuration file <
				modules = [ 
					./home-manager/home.nix
				];
		};
	};
}
