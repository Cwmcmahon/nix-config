{
  description = "A Nix-flake-based RStudio development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self , nixpkgs ,... }: let
    system = "x86_64-linux";
  in {
    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
      };
    in pkgs.mkShell {
      packages = with pkgs; let
				RStudio-with-my-packages = rstudioWrapper.override{
					packages = with rPackages; [ tidyverse shiny quarto crosstalk leaflet plotly sf gt cowplot patchwork ggiraph flexdashboard DT paletteer countrycode tidytuesdayR ];
				};
			in [
				RStudio-with-my-packages
      ];

      shellHook = ''
				exec rstudio
      '';
    };
  };
}
