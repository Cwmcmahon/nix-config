{ pkgs, ... }: {
  imports = [
    ../common.nix
  ];

  # Networking
  networking.hostName = "dell";

  # State Version
  system.stateVersion = "23.11";
}
