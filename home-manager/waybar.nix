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
					background: #292b2e;
					color: #fdf6e3;
				}
				
				#custom-right-arrow-dark,
				#custom-left-arrow-dark {
					color: #1a1a1a;
				}
				#custom-right-arrow-light,
				#custom-left-arrow-light {
					color: #292b2e;
					background: #1a1a1a;
				}
				
				#workspaces,
				#clock,
				#tray,
				#pulseaudio,
				#backlight,
				#battery { 
					background: #1a1a1a;
				}
 
				#workspaces button {
					padding: 0 2px;
					color: #fdf6e3;
				}
				#workspaces button.active {
					color: #ff5f08;
				}
				#workspaces button:hover {
					box-shadow: inherit;
					text-shadow: inherit;
					background: #1a1a1a;
					padding: 0 2px;
				}
 
				#pulseaudio {
					color: #1595ca;
				}
				#pulseaudio.muted {
					color: #c5192b;
				}
 
				#backlight {
					color: #f6bb40;
				}
 
				#battery {
					color: #19bf45;
				}
				#battery.critical:not(.charging) {
					color: #c5192b;
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
