{ pkgs, ... }: {
  imports = [
    ../common.nix
  ];

  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    alacritty
    fuzzel
  ];

  # Networking
  networking.hostName = "dell-nixos";

  system.stateVersion = "23.11";
}
