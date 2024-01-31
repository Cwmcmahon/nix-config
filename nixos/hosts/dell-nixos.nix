{ pkgs, ... }: {
  imports = [
    ../common.nix
  ];

  programs.niri.enable = true;

  xdg.portal = {
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.systemPackages = with pkgs; [
    ironbar
    alacritty
    fuzzel
  ];

  # Networking
  networking.hostName = "dell-nixos";

  system.stateVersion = "23.11";
}
