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

	# Bluetooth
	hardware.bluetooth.enable = true;
	services.blueman.enable = true;

	# Enabling opengl
	hardware.opengl = {
		enable = true;
		driSupport = true;
		driSupport32Bit = true;
	};

	# Enable Wayland.
	services.xserver = {
		enable = true;
		videoDrivers = [ "nvidia" ];
		layout = "us";
		xkbVariant = "";
		displayManager.gdm = {
			enable = true;
			wayland = true;
		};
	};

	# Enable the OpenSSH server
	services.sshd.enable = true;

	# Make swaylock work with password
	security.pam.services.swaylock = {};

	# Wayland desktop portals
	xdg.portal = {
		enable = true;
		extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
	};

	# Enable Hyprland
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

	# Enable bash
	programs.bash = {
		enableCompletion = true;
	};

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
		rofi-wayland
		wl-clipboard
		cliphist
		font-manager
		gnome.nautilus
		gnome.eog
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
  ];

	# Set Neovim as default editor
	environment.variables = {
		EDITOR = "nvim";
		VISUAL = "nvim";
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

	# Brightness control
	programs.light.enable = true;

	# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
	system.stateVersion = "23.05";
}
