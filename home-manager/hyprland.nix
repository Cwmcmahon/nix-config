{
	imports = [
	];

	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;
		settings = {
			monitor = [
				"eDP-1,1920x1080,auto,1"
				"HDMI-A-1,1920x1080,auto,auto"
			];
			exec-once = [
				"swaybg -i ~/Pictures/Wallpapers/mult_falls.jpg"
				"waybar"
				"nm-applet"
				"blueman-applet"
				"swayidle -w timeout 120 'hyprctl dispatch dpms off' timeout 150 'swaylock -f'"
				"swayidle -w timeout 10 'if pgrep -x swaylock; then hyprctl dispatch dpms off; fi'"
			];
			env = "XCURSOR_SIZE,24";
			input = {
				kb_layout = "us";
				follow_mouse = 2;
				touchpad = {
					natural_scroll = true;
					tap-and-drag = true;
				};
			};
			general = {
				gaps_in = 3;
				gaps_out = 3;
				border_size = 2;
				"col.active_border" = "rgba(feba1bee) rgba(d65d0eee) 45deg";
				"col.inactive_border" = "rgba(504945aa)";
				layout = "master";
			};
			misc = {
				focus_on_activate = true;
				new_window_takes_over_fullscreen = 2;
				disable_hyprland_logo = true;
				disable_splash_rendering = true;
				mouse_move_enables_dpms = true;
				key_press_enables_dpms = true;
			};
			group = {
				"col.border_active" = "rgba(feba1bee) rgba(d65d0eee) 45deg";
				"col.border_inactive" = "rgba(504945aa)";
				groupbar = {
					font_size = 10;
					gradients = false;
					"col.active" = "rgba(d3869bee)" ;
					"col.inactive" = "rgba(504945aa)";
				};
			};
			decoration = {
				rounding = 10;
				blur = {
					enabled = false;
					size = 3;
					passes = 1;
					new_optimizations = true;
				};
				drop_shadow = false;
				shadow_range = 4;
				shadow_render_power = 3;
				"col.shadow" = "rgba(1a1a1aee)";
			};
			animations = {
				enabled = true;
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
				pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
				preserve_split = true; # you probably want this
			};
			master = {
				new_is_master = false;
				new_on_top = true;
			};
			gestures	= {
				workspace_swipe = "on";
			};
			# See https://wiki.hyprland.org/Configuring/Keywords/ for more
			"$mainMod" = "SUPER";
			# Semi-custom binds
			bind = [
				"$mainMod, A, exec, rofi -show drun -show-icons"
				"$mainMod, Q, killactive,"
				"$mainMod, E, exit,"
				"$mainMod, RETURN, exec, kitty"
				"$mainMod, B, exec, firefox"
				"$mainMod, F, exec, nautilus"
				"$mainMod, T, exec, todofi.sh"
				"$mainMod, M, fullscreen, 1"
				"$mainMod, N, exec, io.gitlab.news_flash.NewsFlash"
				# "$mainMod, O, togglesplit," # dwindle
				"$mainMod, S, layoutmsg, swapwithmaster auto" # master
				"$mainMod, O, layoutmsg, orientationcycle right left" # master
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
				"$mainMod SHIFT, S, changegroupactive, f"
				"$mainMod SHIFT, G, moveoutofgroup,"
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
