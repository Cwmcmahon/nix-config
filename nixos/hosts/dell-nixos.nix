{ ... }: {
  imports = [
    ../common.nix
  ];

  # Networking
  networking = {
    hostName = "dell-nixos";
    networkmanager.enable = true;
  };

  swapDevices = [ {
      device = "/var/lib/swapfile";
      size = 16*1024;
  } ];

  system.stateVersion = "23.11";
}
