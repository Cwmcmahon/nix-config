{
  imports = [
  ];

  programs = {
    waybar = {
      enable = true;
      settings = {
        mainBar = {
          exclusive = true;
          layer = "top";
          modules-left = [
            "custom/right-arrow-light"
            "idle_inhibitor"
            "custom/right-arrow-dark"
            "custom/right-arrow-light"
            "hyprland/workspaces"
            "custom/right-arrow-dark"
            "custom/window-right-arrow-light"
            "hyprland/window"
            "custom/window-right-arrow-dark"
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
            "group/audio"
            "custom/left-arrow-light"
            "custom/left-arrow-dark"
            "backlight"
            "custom/left-arrow-light"
            "custom/left-arrow-dark"
            "group/power"
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
          "custom/window-right-arrow-dark" = {
            format = "";
            tooltip = false;
          };
          "custom/window-right-arrow-light" = {
            format = "";
            tooltip = false;
          };
          "idle_inhibitor" = {
            format = "{icon}";
            format-icons = {
              activated = "";
              deactivated = "";
            };
            tooltip-format-activated = "Idle inhibitor: {status}";
            tooltip-format-deactivated = "Idle inhibitor: {status}";
          };
          "hyprland/workspaces" = {
            format = "{name}";
            format-window-separator = " ";
            window-rewrite-default = "";
            window-rewrite = {
              kitty = "";
              rofi = "";
              firefox = "";
              steam = "";
              itch = "";
              discord = "";
              rstudio = "";
              VScodium = "";
              eog = "";
              Nautilus = "";
              chromium = "";
              newsflash = "";
            };
            on-scroll-up = "hyprctl dispatch workspace e+1";
            on-scroll-down = "hyprctl dispatch workspace e-1";
          };
          "hyprland/window" = {
            format = " {class} ";
            rewrite = {
              "(.*)Nautilus(.*)" = " Nautilus ";
              "(.*)newsflash(.*)"  = " newsflash ";
              "(.*)eog(.*)" = " Eye of Gnome ";
              "(.*)Vivaldi(.*)" = " Vivaldi " ;
            };
          };
          "clock" = {
            format = "{:%b %e %I:%M %p}";
            tooltip-format = "<small>{calendar}</small>";
            calendar = {
              on-scroll = 1;
              mode-mon-col = 3;
              format = {
                months = "<span color='#ebdbb2'><b>{}</b></span>";
                days = "<span color='#ebdbb2'>{}</span>";
                weekdays = "<span color='#fabd2f'>{}</span>";
                today = "<span color='#cc241d'><b>{}</b></span>";
              };
            };
            actions = {
              on-click-right = "mode";
              on-scroll-up = "shift_up";
              on-scroll-down = "shift_down";
            };
          };
          "tray" = {
            icon-size = 20;
            spacing = 10;
          };
          "group/audio" = {
            orientation = "horizontal";
            modules = [
              "pulseaudio"
              "mpris"
            ];
            drawer = {
              transition-duration = 250;
              transition-left-to-right = false;
              children-class = "audio";
            };
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
            reverse-scrolling = true;
            on-click = "pamixer -t";
            on-click-right = "pavucontrol";
            max-length = 7;
            min-length = 7;
            tooltip-format = "Audio level: {volume:3}%";
          };
          "mpris" = {
            format = "{dynamic}";
            dynamic-len = 27;
            title-len = 24;
            dynamic-order = [
              "title"
              "artist"
            ];
          };
          "backlight" = {
            format = "{icon} {percent:3}%";
            format-icons = [ "" "" ];
            on-scroll-down = "light -U 10";
            on-scroll-up = "light -A 10";
            max-length = 7;
            min-length = 7;
            tooltip-format = "Brightness: {percent:3}%";
          };
          "group/power" = {
            orientation = "horizontal";
            modules = [
              "battery"
              "custom/shutdown"
              "custom/reboot"
              "custom/lock"
            ];
            drawer = {
              transition-duration = 250;
              transition-left-to-right = false;
              children-class = "power";
            };
          };
          "battery" = {
            states = {
              good = 95;
              warning = 30;
              critical = 15;
            };
            format = "{icon} {capacity:3}%";
            format-charging = " {capacity:3}%";
            format-icons = [ "" "" "" "" "" ];
            max-length = 7;
            min-length = 7;
            interval = 1;
          };
          "custom/reboot" = {
            format = "";
            on-click = "systemctl reboot";
            tooltip = false;
          };
          "custom/shutdown" = {
            format = "";
            on-click = "shutdown now";
            tooltip = false;
          };
          "custom/lock" = {
            format = "";
            on-click = "swaylock -f && hyprctl dispatch dpms off";
            tooltip = false;
          };
        };
      };
      style = ''
        * {
          font-size: 20px;
          font-family: Hack, monospace, "Font Awesome 5 Brands,Font Awesome 5 Brands Regular", "Font Awesome 5 Free,Font Awesome 5 Free Solid";
        }
 
        window#waybar {
          background: #3c3836;
          color: #ebdbb2;
        }
        
        #custom-right-arrow-dark,
        #custom-left-arrow-dark, 
        #custom-window-right-arrow-dark {
          color: #282828;
        }
        #custom-right-arrow-light,
        #custom-left-arrow-light,
        #custom-window-right-arrow-light {
          color: #3c3836;
          background: #282828;
        }

        #idle_inhibitor,
        #workspaces,
        #window,
        #clock,
        #tray,
        #pulseaudio,
        #mpris,
        #backlight,
        #battery,
        #custom-reboot,
        #custom-shutdown,
        #custom-lock {
          background: #282828;
        }

        #idle_inhibitor.activated {
          color: #cc241d;
        }
        #idle_inhibitor.deactivated {
          color: #ebdbb2;
        }
 
        #workspaces button {
          color: #ebdbb2;
          padding: 0 4px;
        }
        #workspaces button.active {
          color: #d65d0e;
          padding: 0 4px;
        }
        #workspaces button:hover {
          box-shadow: inherit;
          text-shadow: inherit;
          border: #282828;
          background: #282828;
          padding: 0 4px;
        }

        window#waybar.fullscreen #window {
          color: #d65d0e;
        }
        window#waybar.empty #window, 
        window#waybar.empty #custom-window-right-arrow-dark,
        window#waybar.empty #custom-window-right-arrow-light {
          color: #3c3836;
          background: #3c3836;
        }

        #pulseaudio,
        #mpris {
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

        #idle_inhibitor,
        #clock,
        #tray,
        #pulseaudio,
        #mpris,
        #backlight,
        #battery,
        #custom-reboot,
        #custom-lock,
        #custom-shutdown {
          padding: 0 10px;
        }
      '';
    };
  };
}
