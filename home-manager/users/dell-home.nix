{ ... }: {
  imports = [
    ../home-common.nix
    ../river.nix
  ];

  programs = {
    eww = {
      enable = true;
      configDir = ../eww;
    };
  };
}
