{
	imports = [
	];

	xdg.configFile.autoname_workspaces = {
		target = "hyprland-autoname-workspaces/config.toml";
		text = ''
			[format]
			dedup = true
			delim = " "
			client = "{icon}{delim}"
			workspace = "{id}:{delim}{clients}"
			client_dup = "{icon}{counter_sup}{delim}"
			client_dup_fullscreen = "[{icon}]{delim}{icon}{counter_unfocused_sup}"
			client_fullscreen = "[{icon}]{delim}"

			[class]
			DEFAULT = ""
			kitty = ""
			firefox = ""
			steam = ""
			discord = ""
			rstudio = ""
			VSCodium = ""
			eog = ""
			"org.gnome.Nautilus" = ""

			[exclude]
			"" = "^$"
			"Rofi" = ".*"
		'';
	};	
}
