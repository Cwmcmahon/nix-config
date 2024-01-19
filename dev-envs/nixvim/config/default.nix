{
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
  ];

  colorschemes.gruvbox.enable = true;

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
}
