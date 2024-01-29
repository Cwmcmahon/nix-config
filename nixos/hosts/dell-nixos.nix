{ ... }: {
  imports = [
    ../common.nix
  ];

  # Networking
  networking.hostName = "dell-nixos";

  # Swap
  swapDevices = [ {
      device = "/var/lib/swapfile";
      size = 16*1024;
  } ];

  boot.resumeDevice = "/var/lib/swapfile";

  system.stateVersion = "23.11";
}
