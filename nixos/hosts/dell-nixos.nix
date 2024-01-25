{ ... }: {
  imports = [
    ../common.nix
  ];

  # Networking
  networking = {
    hostName = "dell";
    networkmanager.enable = true;
  };
}
