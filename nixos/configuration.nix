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
		nvidiaPatches = true;
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
	environment.systemPackages =
		let
			daily_todo = import ./daily_todo.nix { inherit pkgs };
		in with pkgs; [
			home-manager
			firefox-wayland
			waybar
			wbg
			libnotify
			mako
			kitty
			rofi-wayland
			neovim
			xfce.thunar
			font-manager
			git
			gh
			pamixer
			pavucontrol
			networkmanagerapplet
			glib
			grim
			slurp
			papirus-icon-theme
			kakoune
			pandoc
			todo-txt-cli
			daily_todo
		];

	# Syncthing enable and config
	services = {
		syncthing = {
			enable = true;
			user = "carterm";
			dataDir = "/home/carterm/Documents";
			configDir = "/home/carterm/Documents/.config/syncthing";
		};
	};

	# Set Kakoune as default editor
	environment.variables = {
		EDITOR = "kak";
		VISUAL = "kak";
	};

	# Fonts!
	fonts = {
		packages = with pkgs; [
			font-awesome
			hack-font
			#(google-fonts.override { fonts = [ "Roboto" "Signika" "Alegreya" "Alegreya Sans" ]; })
		];
		enableDefaultPackages = true;
	};

	# Brightness control
	programs.light.enable = true;

	# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
	system.stateVersion = "23.05";
}
