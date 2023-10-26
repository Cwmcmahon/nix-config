{ inputs, lib, config, pkgs, host, ... }: {
	# You can import other home-manager modules here
	imports = [
		./hyprland.nix
		./waybar.nix
		./todo.nix
		./aliases.nix
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
		#syncthing = {
		#	enable = true;
		#};
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
		#direnv = {
		#	enable = true;
		#	enableBashIntegration = true;
		#	nix-direnv.enable = true;
		#};
	};

	# Nicely reload system units when changing configs
	systemd.user.startServices = "sd-switch";

	# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
	home.stateVersion = "22.11";
}
