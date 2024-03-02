{ ... }: {
  imports = [
    ../common.nix
  ];
  
  # Networking
  networking.hostName = "samsung";
     
  # State Version
  system.stateVersion = "23.05";
}
