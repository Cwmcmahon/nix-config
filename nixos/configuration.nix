{ inputs, lib, config, pkgs, ... }: {
	# You can import other NixOS modules here
	imports = [
		./hardware-configuration.nix
	];

	nixpkgs = {
		# You can add overlays here
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

	# Suspend to RAM
	boot.kernelParams = [ "mem_sleep_default=s2idle" ];

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

	# Power management
	powerManagement.enable = true;

	# Networking
	networking = {
		hostName = "cwm-nixos";
		networkmanager.enable = true;
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

	# Enable the X11 windowing system.
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

	# Nvidia setup
	hardware.nvidia = {
		modesetting.enable = true;
		open = false;
		nvidiaSettings = true;
	};

	# Wayland desktop portals
	xdg.portal = {
		enable = true;
		extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
	};

	# Enable Hyprland
	programs.hyprland = {
		enable = true;
		enableNvidiaPatches = true;
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
	environment.systemPackages = with pkgs;
		let
			RStudio-with-my-packages = rstudioWrapper.override{
				packages = with rPackages; [ tidyverse shiny quarto crosstalk leaflet plotly sf gt cowplot patchwork ggiraph flexdashboard DT paletteer countrycode tidytuesdayR ];
			};
		in
		[
			home-manager
			waybar
			swaybg
			libnotify
			mako
			swayidle
			kitty
			rofi-wayland
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
			kakoune
			pandoc
			todo-txt-cli
			todofi-sh
			vscodium
			steam-run
			RStudio-with-my-packages
			unzip
			discord
			chromium
			newsflash
			#eww-wayland # One day, when I'm braver (or just have the time)
		];

	# Set Kakoune as default editor
	environment.variables = {
		EDITOR = "kak";
		VISUAL = "kak";
	};

	# Firefox
	programs.firefox = {
		enable = true;
	};

	# Steam
	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = true;
	};

	# Fonts!
	fonts = {
		packages = with pkgs; [
			font-awesome_5
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
