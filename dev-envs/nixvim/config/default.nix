{pkgs, ...}: {
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
      extensions = {
        fzf-native.enable = true;
      };
    };

    plugins.treesitter = {
      enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      nvim-web-devicons
    ];

    options = {
      guifont = "Hack,Font Awesome 5 Free\\,Font Awesome 5 Free Regular";

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
