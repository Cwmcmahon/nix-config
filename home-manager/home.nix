{ inputs, lib, config, pkgs, host, ... }: {
  # You can import other home-manager modules here
  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./todo.nix
    ./bash.nix
  ];

  nixpkgs = {
    # You can add overlays here
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  # Username
  home = {
    username = "carterm";
    homeDirectory = "/home/carterm";
  };

  # Services
  services = {
    network-manager-applet.enable = true;
    blueman-applet.enable = true;
    mako = {
      enable = true;
      backgroundColor = "#076678FF";
      borderColor = "#83a598FF";
      borderSize = 3;
      borderRadius = 3;
      textColor = "#fbf1c7FF";
      height = null;
      width = 384;
    };
  }; 

  # MIME Types
  xdg.mimeApps.defaultApplications = {
    "text/*" = [ "codium.desktop"  ];
    "application/pdf" = [ "vivaldi-stable.desktop" ];
    "image/*" = [ "gimp.desktop" ];
  };

  # Enable and configure programs
  programs = {
    home-manager.enable = true;
    bash = {
      enable = true;
      enableCompletion = true;
    };
    kitty = {
      enable = true;
      theme = "Gruvbox Dark Hard";
      font = {
        name = "Hack";
      };
    };
    helix = {
      enable = true;
      settings = {
        theme = "gruvbox_dark_hard";
        editor = {
          scrolloff = 3;
          line-number = "relative";
          lsp.display-messages = true;
        };
      };
    };
    rofi = {
      enable = true;
      theme = "Paper";
    };
    swaylock = {
      enable = true;
      settings = {
        image = "/home/carterm/Pictures/Wallpapers/mult_falls.jpg";
        text-color = "ebdbb2";
        text-caps-lock-color = "d65d0e";
        font-size = 24;
        inside-color = "28282880";
        inside-ver-color = "45858880";
        inside-wrong-color = "cc241d80";
        inside-clear-color = "689d6a80";
        ring-color = "282828";
        ring-ver-color = "458588";
        ring-wrong-color = "cc241d";
        ring-clear-color = "689d6a";
        line-color = "282828";
        line-ver-color = "458588";
        line-wrong-color = "cc241d";
        line-clear-color = "689d6a";
        key-hl-color = "d79921";
        bs-hl-color = "d65d0e";
        indicator-idle-visible = false;
        indicator-radius = 100;
      };
    };
  };

  # GTK icons
  gtk = {
    enable = true;
    iconTheme.name = "Papirus";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
