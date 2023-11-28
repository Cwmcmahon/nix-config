{
	imports = [
	];

	programs = {
		waybar = {
			enable = true;
			settings = {
				mainBar = {
					layer = "top";
					modules-left = [
						"custom/right-arrow-light"
						"hyprland/workspaces" 
						"custom/right-arrow-dark"
					];
					modules-center = [ 
						"custom/left-arrow-dark"
						"clock"
						"custom/right-arrow-dark"
					];
					modules-right = [ 
						"custom/left-arrow-dark"
						"tray"
						"custom/left-arrow-light"
						"custom/left-arrow-dark"
						"pulseaudio"
						"custom/left-arrow-light"
						"custom/left-arrow-dark"
						"backlight"
						"custom/left-arrow-light"
						"custom/left-arrow-dark"
						"battery"
						"custom/left-arrow-light"
					];
					"custom/left-arrow-dark" = {
						format = "";
						tooltip = false;
					};
					"custom/left-arrow-light" = {
						format = ""; 
						tooltip = false;
					};
					"custom/right-arrow-dark" = {
						format = "";
						tooltip = false;
					};
					"custom/right-arrow-light" = {
						format = "";
						tooltip = false;
					};
					"hyprland/workspaces" = {
						format = "{name}: {windows}";
						format-window-separator = " ";
						window-rewrite-default = "";
						window-rewrite = {
							kitty = "";
							firefox = "";
							steam = "";
							discord = "";
							rstudio = "";
							VScodium = "";
							eog = "";
							Nautilus = "";
						};
						on-scroll-up = "hyprctl dispatch workspace e+1";
						on-scroll-down = "hyprctl dispatch workspace e-1";
					};
					"clock" = {
						format = "{:%b %e	%I:%M %p}";
					};
					"tray" = {
						icon-size = 20;
						spacing = 10;
					};
					"pulseaudio" = {
						format = "{icon} {volume:3}%";
						format-muted = "MUTE";
						format-icons = {
							headphones = "";
							default = [
								""
								""
							];
						};
						scroll-step = 5;
						on-click = "pamixer -t";
						on-click-right = "pavucontrol";
						max-length = 7;
						min-length = 7;
					};
					"backlight" = {
						format = "{icon} {percent:3}%";
						format-icons = [ "" "" ];
						on-scroll-down = "light -U 10";
						on-scroll-up = "light -A 10";
						max-length = 7;
						min-length = 7;
					};
					"battery" = {
						states = {
							good = 95;
							warning = 30;
							critical = 15;
						};
						format = "{icon} {capacity:3}%";
						format-charging = "	{capacity}%";
						format-icons = [ "" "" "" "" "" ];
						interval = 1;
					};
				};
			};
			style = ''
				* {
					font-size: 20px;
					font-family: monospace;
				}
 
				window#waybar {
					background: #3c3836;
					color: #ebdbb2;
				}
				
				#custom-right-arrow-dark,
				#custom-left-arrow-dark {
					color: #282828;
				}
				#custom-right-arrow-light,
				#custom-left-arrow-light {
					color: #3c3836;
					background: #282828;
				}
				
				#workspaces,
				#clock,
				#tray,
				#pulseaudio,
				#backlight,
				#battery { 
					background: #282828;
				}
 
				#workspaces button {
					padding: 0 2px;
					color: #ebdbb2;
				}
				#workspaces button.active {
					color: #d65d0e;
				}
				#workspaces button:hover {
					box-shadow: inherit;
					text-shadow: inherit;
					background: #282828;
					padding: 0 2px;
				}
 
				#pulseaudio {
					color: #458588;
				}
				#pulseaudio.muted {
					color: #cc241d;
				}
 
				#backlight {
					color: #fabd2f;
				}
 
				#battery {
					color: #98971a;
				}
				#battery.critical:not(.charging) {
					color: #cc241d;
				}
 
				#clock,
				#tray,
				#pulseaudio,
				#backlight,
				#battery {
					padding: 0 10px;
				}
			'';
		};
	};
}
