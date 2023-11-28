{ inputs, lib, config, pkgs, host, ... }: {
	# You can import other home-manager modules here
	imports = [
		./hyprland.nix
		./waybar.nix
		./todo.nix
		./aliases.nix
		#./autoname_workspaces.nix
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
		shellAliases = {
		};
	};

	# Services
	services = {
		network-manager-applet.enable = true;
		blueman-applet.enable = true;
		swayidle = {
			enable = true;
			timeouts = [
				{ timeout = 300; command = "swaylock"; }
				{ timeout = 305; command = "hyprctl dispatch dpms off"; resumeCommand = "hyprctl dispatch dpms on"; }
			];
		};
	}; 

	# GTK enable and icons
	gtk = {
		enable = true;
		iconTheme.name = "Papirus";
	};

	# MIME Types
	xdg.mimeApps.defaultApplications = {
		"text/*" = [ "codium.desktop"  ];
		"application/pdf" = [ "firefox.desktop" ];
		"image/*" = [ "org.gnome.eog.desktop"  ];
	};

	# Enable and configure programs
	programs = {
		home-manager.enable = true;
		git.enable = true;
		bash = {
			enable = true;
			enableCompletion = true;
		};
		kitty = {
			enable = true;
			theme = "Gruvbox Dark Hard";
		};
		kakoune = {
			enable = true;
			config = {
				alignWithTabs = true;
				indentWidth = 0;
				colorScheme = "gruvbox-dark";
				numberLines = {
					enable = true;
					highlightCursor = true;
				};
				tabStop = 2;
			};
			defaultEditor = true;
		};
		rofi = {
			enable = true;
			theme = "Paper";
		};
		anyrun = {
			enable = true;
			config = {
				plugins = [
					inputs.anyrun.packages.${pkgs.system}.applications
					inputs.anyrun.packages.${pkgs.system}.kidex
					inputs.anyrun.packages.${pkgs.system}.shell
					inputs.anyrun.packages.${pkgs.system}.rink
					inputs.anyrun.packages.${pkgs.system}.websearch
					inputs.anyrun.packages.${pkgs.system}.dictionary
				];
				width = { fraction = 0.3; };
				position = "top";
      	verticalOffset = { absolute = 0; };
      	hideIcons = false;
      	ignoreExclusiveZones = false;
      	layer = "overlay";
      	hidePluginInfo = false;
      	closeOnClick = false;
      	showResultsImmediately = false;
      	maxEntries = null;
			};
		};
	};

	# For anyrun to use binary cache instead of building locally
	nix.settings = {
		builders-use-substitutes = true;
		substituters = [
			"https://anyrun.cachix.org"
		];
		trusted-public-keys = [
			"anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
		];
	};

	# Nicely reload system units when changing configs
	systemd.user.startServices = "sd-switch";

	# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
	home.stateVersion = "22.11";
}
