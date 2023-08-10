{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  # Username
  home = {
    username = "carterm";
    homeDirectory = "/home/carterm";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Hyprland config
  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
    settings = {
      monitor = "eDP-1,1920x1080,auto,1";
      exec-once = "wbg ~/Pictures/Wallpapers/mult_falls.jpg & waybar & dunst";
      env = "XCURSOR_SIZE,24";
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
            natural_scroll = "yes";
        };
      };
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
        blur = "yes";
        blur_size = 3;
        blur_passes = 1;
        blur_new_optimizations = "on";
        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };
      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [ "windows, 1, 7, myBezier"
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
      gestures  = {
        workspace_swipe = "off";
      };
      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      "$mainMod" = "SUPER";
      # Semi-custom binds
      bind = [ "$mainMod, T, exec, kitty"
               "$mainMod, Q, killactive,"
               "$mainMod, E, exit,"
               "$mainMod, F, exec, thunar"
               "$mainMod, M, fullscreen 1,"
               "$mainMod, S, exec, rofi -show drun -show-icons"
               "$mainMod, P, layoutmsg, preselect 1" # dwindle
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
        ];
      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [ "$mainMod, mouse:272, movewindow"
                "$mainMod, mouse:273, resizewindow"
	];	
    };
  };

  # Enable and configure programs
  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "battery" "clock" ];
        "hyprland/window" = {
          format = "{class}";
        };
        "battery" = {
          format = "{capacity}% {icon}";
          format-icons = [ "" "" "" "" "" ];
        };
        "clock" = {
          format = "{:%H:%M  %a, %b %d}";
        };
      };
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
