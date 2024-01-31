{
  imports = [
  ];

  programs.ironbar = {
    enable = true;
    config = {
      ironvar_defaults = {
        r-arrow-light = "";
        r-arrow-dark = "";
        l-arrow-light = "";
        l-arrow-dark = "";
      };
      position = "top";
      height = 24;
      start = [];
      center = [
        {
          type = "label";
          label = "#l-arrow-light";
          class = "light-arrow";
        }
        {
          type = "label";
          label = "#l-arrow-dark";
          class = "dark-arrow";
        }
        {
          type = "clock";
          format = "%b %e %I:%M %p";
        }
        {
          type = "label";
          label = "#r-arrow-dark";
          class = "dark-arrow";
        }
        {
          type = "label";
          label = "#r-arrow-light";
          class = "light-arrow";
        }
      ];
      end = [];
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

      .widget {
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
