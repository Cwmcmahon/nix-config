{
  description = "river-bedload flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    bedload = {
      url = "git+https://git.sr.ht/~novakane/river-bedload?submodules=1";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, bedload }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    packages.${system}.default = pkgs.stdenv.mkDerivation { 
      name = "river-bedload";
      version = "2024-01-21";

      src = inputs.bedload;

      nativeBuildInputs = with pkgs; [
        zig_0_11.hook
        wayland
        wayland-protocols
        pkg-config
      ];
    };
  };
}
