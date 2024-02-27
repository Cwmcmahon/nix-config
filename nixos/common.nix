{ pkgs, lib, inputs, config, ... }: { 
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  nixpkgs = {
    overlays = [
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  }; 

  # Bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Firmware updater
  services.fwupd.enable = true;

  # Time zone
  time.timeZone = "America/Los_Angeles";

  # Internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Networking
  networking.networkmanager.enable = true;

  # Enabling opengl
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  
  # Enable Wayland
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  xdg.portal = {
    enable = true;
    configPackages = [ pkgs.river ];
    config = {
      common = {
        default = [ "wlr" ];
        "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
      };
    };
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services.dbus.implementation = "broker";
 
  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable the OpenSSH server
  services.sshd.enable = true;
 
  # Automatic USB mounting
  services.devmon.enable = true;

  # Make swaylock work with password
  security.pam.services.swaylock = {};

  # Brightness control
  programs.light.enable = true;

  # Users
  users.users = {
    carterm = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
      ];
      extraGroups = [ "networkmanager" "wheel" "video" ];
    };
  };

  # System Packages
  environment.systemPackages = with pkgs; [
    home-manager
    waybar
    swaybg
    libnotify
    mako
    swayidle
    swaylock
    kitty
    alacritty
    helix
    nil
    rofi-wayland
    wl-clipboard
    cliphist
    git
    gh
    pamixer
    pavucontrol
    networkmanagerapplet
    grim
    slurp
    papirus-icon-theme
    pandoc
    todo-txt-cli
    todofi-sh
    vscodium
    unzip
    vivaldi
    newsflash
    quarto
    sway-audio-idle-inhibit
    playerctl
    ripgrep
    bat
    busybox
    udevil
    trashy
    nwg-look
    dbus
    kickoff
  ];

  programs.thunar.enable = true;

  # Set Helix as default editor
  environment.variables = {
    EDITOR = "hx";
    VISUAL = "hx";
    TERM = "alacritty";
  };

  #environment.sessionVariables = {
  #  XDG_SESSION_TYPE = "wayland";
  #  XDG_CURRENT_DESKTOP = "river";
  #  XDG_SESSION_DESKTOP = "river";
  #};

  # Fonts!
  fonts = {
    packages = with pkgs; [
      font-awesome_5
      nerdfonts
      hack-font
    ];
    enableDefaultPackages = true;
    fontDir.enable = true;
    fontconfig = {
      enable = true;
    };
  };
}
