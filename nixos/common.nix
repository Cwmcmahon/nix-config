{ pkgs, lib, inputs, config, ... }: { 
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

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
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  } // (if (config.networking.hostName == "samsung") # Make s2idle default sleep mode on samsung laptop
    then {
      kernelParams = [ "mem_sleep_default=s2idle" ];
    }
    else {}
  );

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

  # Nvidia settings on samsung laptop
  hardware.nvidia = {
  } // (if (config.networking.hostName == "samsung")
    then {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
    }
    else {}
  );
  
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
  } // (if (config.networking.hostName == "samsung") # Add nvidia drivers on samsung laptop
    then {
      videoDrivers = [ "nvidia" ];
    }
    else {}
  );

  # Enable riverwm
  programs.river.enable = true;

  # Portal settings
  xdg.portal = {
    configPackages = [ pkgs.river ];
    config = {
      common = {
        default = [ "wlr" ];
        "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
      };
    };
  };

  # Fixes some portal issues for me
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
    alacritty
    helix
    nil
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
    vscodium
    unzip
    vivaldi
    newsflash
    quarto
    sway-audio-idle-inhibit
    ripgrep
    bat
    busybox
    udevil
    trashy
    dbus
    kickoff
    filtile
  ] ++ (if (config.networking.hostName == "samsung") # Add gaming packages on samsung laptop
    then with pkgs; [
      steam-run
      itch
      discord 
    ]
    else []
  );

  # File manager
  programs.thunar.enable = true;

  # Enable steam on samsung laptop
  programs.steam = { 
  } // ( if (config.networking.hostName == "samsung")
    then {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    } 
    else {
      enable = false;
    }
  );

  # Set Helix as default editor
  environment.variables = {
    EDITOR = "hx";
    VISUAL = "hx";
    TERM = "alacritty";
  };

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
