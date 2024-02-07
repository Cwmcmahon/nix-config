{ pkgs, ... }: {
  imports = [
    ../common.nix
  ];

  #programs.niri.enable = true;
  programs.river.enable = true;

  xdg.portal = {
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services.upower.enable = true;

  environment.systemPackages = with pkgs; [
    ironbar
    alacritty
    kickoff
    rivercarro
  ];

  # Networking
  networking.hostName = "dell-nixos";

  system.stateVersion = "23.11";
}
