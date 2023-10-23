{
	imports = [
	];

	wayland.windowManager.hyprland = {
		enable = true;
		enableNvidiaPatches = true;
		xwayland.enable = true;
		settings = {
			monitor = "eDP-1,1920x1080,auto,1";
			exec-once = [
				"wbg ~/Pictures/Wallpapers/mult_falls.jpg"
				"waybar"
				"nm-applet"
				"blueman-applet"
			];
			env = "XCURSOR_SIZE,24";
			input = {
				kb_layout = "us";
				follow_mouse = 1;
				touchpad = {
					natural_scroll = "yes";
				};
			};
			general = {
				gaps_in = 3;
				gaps_out = 3;
				border_size = 2;
				"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
				"col.inactive_border" = "rgba(595959aa)";
				"col.group_border_active" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
				"col.group_border" = "rgba(595959aa)";
				layout = "dwindle";
			};
			decoration = {
				rounding = 10;
				blur = {
					enabled = true;
					size = 3;
					passes = 1;
					new_optimizations = true;
				};
				drop_shadow = "yes";
				shadow_range = 4;
				shadow_render_power = 3;
				"col.shadow" = "rgba(1a1a1aee)";
			};
			animations = {
				enabled = "yes";
				bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
				animation = [ 
					"windows, 1, 7, myBezier"
					"windowsOut, 1, 7, default, popin 80%"
					"border, 1, 10, default"
					"borderangle, 1, 8, default"
					"fade, 1, 7, default"
					"workspaces, 1, 6, default"
				];
			};
			dwindle = {
				pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
				preserve_split = "yes"; # you probably want this
			};
			master = {
				new_is_master = "true";
			};
			gestures	= {
				workspace_swipe = "off";
			};
			# See https://wiki.hyprland.org/Configuring/Keywords/ for more
			"$mainMod" = "SUPER";
			# Rofi
			bindr = [
				"$mainMod, SUPER_L, exec, rofi -show drun -show-icons"
			];
			# Semi-custom binds
			bind = [ 
				"$mainMod, Q, killactive,"
				"$mainMod, E, exit,"
				"$mainMod, RETURN, exec, kitty"
				"$mainMod, B, exec, firefox"
				"$mainMod, F, exec, thunar"
				#"$mainMod, R, exec, rofi -show drun -show-icons"
				"$mainMod, T, exec, todofi.sh"
				"$mainMod, M, fullscreen, 1"
				"$mainMod, O, togglesplit," # dwindle	
				# Move focus with mainMod + arrow keys
				"$mainMod, left, movefocus, l"
				"$mainMod, right, movefocus, r"
				"$mainMod, up, movefocus, u"
				"$mainMod, down, movefocus, d"					 
				# Switch workspaces with mainMod + [0-9]
				"$mainMod, 1, workspace, 1"
				"$mainMod, 2, workspace, 2"
				"$mainMod, 3, workspace, 3"
				"$mainMod, 4, workspace, 4"
				"$mainMod, 5, workspace, 5"
				"$mainMod, 6, workspace, 6"
				"$mainMod, 7, workspace, 7"
				"$mainMod, 8, workspace, 8"
				"$mainMod, 9, workspace, 9"
				"$mainMod, 0, workspace, 10"
				# Move active window to a workspace with mainMod + SHIFT + [0-9]
				"$mainMod SHIFT, 1, movetoworkspace, 1"
				"$mainMod SHIFT, 2, movetoworkspace, 2"
				"$mainMod SHIFT, 3, movetoworkspace, 3"
				"$mainMod SHIFT, 4, movetoworkspace, 4"
				"$mainMod SHIFT, 5, movetoworkspace, 5"
				"$mainMod SHIFT, 6, movetoworkspace, 6"
				"$mainMod SHIFT, 7, movetoworkspace, 7"
				"$mainMod SHIFT, 8, movetoworkspace, 8"
				"$mainMod SHIFT, 9, movetoworkspace, 9"
				"$mainMod SHIFT, 0, movetoworkspace, 10"
				# Scroll through existing workspaces with mainMod + scroll
				"$mainMod, mouse_down, workspace, e+1"
				"$mainMod, mouse_up, workspace, e-1"
				# Move active window around with mainMod + CONTROL + arrow keys
				"$mainMod CONTROL, left, movewindow, l"								
				"$mainMod CONTROL, right, movewindow, r"
				"$mainMod CONTROL, up, movewindow, u"
				"$mainMod CONTROL, down, movewindow, d"
				# Group settings 
				"$mainMod, G, togglegroup,"
				"$mainMod, N, changegroupactive, f"
				"$mainMod, L, moveoutofgroup,"
				# Screenshot with Prt Sc button
				'', Print, exec, grim -g "$(slurp)"''
			];
			binde = [
				# Adjust brightness or volume					 
				",F2, exec, light -U 10"
				",F3, exec, light -A 10"
				",F6, exec, pamixer -t"
				",F7, exec, pamixer -d 5"
				",F8, exec, pamixer -i 5"
			];
			# Move/resize windows with mainMod + LMB/RMB and dragging
			bindm = [
				"$mainMod, mouse:272, movewindow"
				"$mainMod, mouse:273, resizewindow"
			]; 
		};
	};
}
