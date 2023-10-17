{ inputs, lib, config, pkgs, host, ... }: {
	# You can import other home-manager modules here
	imports = [
		./hyprland.nix
		./waybar.nix
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
			# Doing this when I understand it better and can do it with home-manager as well
			#rebuild nixos = "sudo nixos-rebuild switch --flake ~/Documents/nix-config/#${host}"
		};
	};

	# Services
	services = {
		network-manager-applet.enable = true;
		blueman-applet.enable = true;
		syncthing = {
			enable = true;
		};
	}; 

	# GTK enable and icons
	gtk = {
		enable = true;
		iconTheme.name = "Papirus";
	};

	# Enable and configure programs
	programs = {
		home-manager.enable = true;
		git.enable = true;
		bash = {
			enable = true;
			enableCompletion = true;
			shellAliases = {
				# add good ones here
			};
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
		neovim = {
			enable = true;
			#defaultEditor = true;
			viAlias = true;
			vimAlias = true;
			vimdiffAlias = true;
			extraLuaConfig = ''
				vim.o.clipboard = "unnamedplus"
				vim.o.number = true
				vim.o.tabstop = 2
				vim.o.shiftwidth = 2
				vim.o.termguicolors = true
			'';
		};
		rofi = {
			enable = true;
			theme = "Paper";
		};
	};

	# Non-Home Manager config files
	home.file = {
		todo = {
			target = ".todo/config";
			text = "";
		};
	};

	# Nicely reload system units when changing configs
	systemd.user.startServices = "sd-switch";

	# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
	home.stateVersion = "22.11";
}
