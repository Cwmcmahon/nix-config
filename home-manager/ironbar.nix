{
  imports = [
  ];

  programs.ironbar = {
    enable = true;
    systemd = true;
    config = let 
      r-a-l = {
        type = "label";
        label = "#r-arrow-light";
        class = "light-arrow";
      };
      r-a-d = {
        type = "label";
        label = "#r-arrow-dark";
        class = "dark-arrow";
      };
      l-a-l = {
        type = "label";
        label = "#l-arrow-light";
        class = "light-arrow";
      };
      l-a-d = {
        type = "label";
        label = "#l-arrow-dark";
        class = "dark-arrow";
      };
    in {
      ironvar_defaults = {
        r-arrow-light = "";
        r-arrow-dark = "";
        l-arrow-light = "";
        l-arrow-dark = "";
      };
      position = "top";
      height = 24;
      start = [
        r-a-l
        {
          type = "focused";
          icon_size = 20;
          show_label = false;
          truncate = {
            mode = "start";
            max_length = 23;
          };
        }
        r-a-d
      ];
      center = [
        l-a-d
        {
          type = "clock";
          format = "%b %e %I:%M %p";
        }
        r-a-d
      ];
      end = [
        l-a-d
        {
          type = "tray";
        }
        l-a-l
        l-a-d
        {
          type = "upower";
          icon_size = 20;
        }
        l-a-l
      ];
    };
    style = ''
      @define-color bar_bg #3c3836;
      @define-color mod_bg #282828;
      @define-color font #ebdbb2;

      * {
        font-size: 20px;
        font-family: Hack, monospace, "Font Awesome 5 Brands,Font Awesome 5 Brands Regular", "Font Awesome 5 Free,Font Awesome 5 Free Solid";
        border: none;
        border-radius: 0;
        box-shadow: none;
        padding: 0px;
      }

      .background {
        background: @bar_bg;
        color: @font;
      }

      .widget,
      .popup {
        background: @mod_bg;
        color: @font;
      }

      .dark-arrow {
        background: @bar_bg; 
        color: @mod_bg;
      }

      .light-arrow {
        color: @bar_bg;
      }
    '';
  };
}
