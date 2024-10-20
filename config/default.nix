{
  # Import all your configuration modules here
  imports = [ ./bufferline.nix ];

  enableMan = true;

  opts = {
     number = true;
     shiftwidth = 2;
  };

  viAlias = true;
  vimAlias = true;

  colorschemes.tokyonight.enable = true;
 
  globals.mapLeader = " ";

  plugins = {
    lualine.enable = true;
    telescope.enable = true;
    oil.enable = true;
    treesitter.enable = true;
    luasnip.enable = true;
    
    lsp = {
      enable = true;
      servers = {
        ts_ls.enable = true;

        lua_ls.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = true;
        };

        nixd = {
          enable = true;
          autostart = true;
        };
        nil_ls = {
          enable = true;
          autostart = true;
        };
      };
    };

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "luasnip"; }
        ];

        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
	  "<Tab>" = ''
	   cmp.mapping(
	     function(fallback)
		if cmp.visible() then
		 cmp.select_next_item()
		elseif luasnip.expandable() then
		 luasnip.expand()
		elseif luasnip.expand_or_jumpable() then
		 luasnip.expand_or_jump()
		elseif check_backspace() then
		 fallback()
		else
		 fallback()
		end
	     end
	   ,
	   { "i", "s" }
	 )
	 '';
        };
      };

    };
  };
}
