{
# Import all your configuration modules here
  imports = [
    ./bufferline.nix
  ];

  config = {
    colorschemes.gruvbox.enable = true;

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    plugins.lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true;
      };
    };

    plugins.nvim-cmp = {
      enable = true;
      autoEnableSources = true;
      sources = [
      {name = "nvim_lsp";}
      {name = "path";}
      {name = "buffer";}
      ];
    };

    plugins.telescope = {
      enable = true;
      keymaps = {
        "<C-p>" = {
          action = "find_files";
        };
        "<leader>fg" = {
          action = "live_grep";
        };
      };
    };

    plugins.treesitter = {
      enable = true;
    };

    options = {
      number = true;
      relativenumber = true;
      cursorline = true;

      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;

      scrolloff = 3;
      sidescrolloff = 3;
    };

    globals = {
      mapleader = " ";
    };
  };
}
