{ ... }: {
  imports = [
    ../common.nix
  ];

  # Networking
  networking = {
    hostName = "dell";
    networkmanager.enable = true;
  };

  environment.persistence."/persistent" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/systemd/coredump"
      "/var/lib/bluetooth"
      "/etc/NetworkManager/system-connections"
      "/etc/ssh"
    ];
    users.carterm = {
      directories = [
        "Documents"
        "Downloads"
        "Music"
        "Pictures"
        "Videos"
        { directory = ".ssh"; mode = "0700"; }
        { directory = ".local/share/keyrings"; mode = "0700"; }
      ];
      files = [
        ".gitconfig"
      ];
    };
  };
}
