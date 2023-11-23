
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

plugins = { 
	{ 
		"nyoom-engineering/oxocarbon.nvim",
		"catppuccin/nvim",
		"ful1e5/onedark.nvim",
		"neanias/everforest-nvim",
		-- Add in any other configuration; 
		--   event = foo, 
		--   config = bar
		--   end,
	}, 
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		}
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	{
		"nvim-lualine/lualine.nvim"
	},
	{
		"voldikss/vim-floaterm"
	},
	{
		"pocco81/auto-save.nvim",
	},
	{
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	{
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		config = function ()
			require'cmp'.setup {
				snippet = {
					expand = function(args)
						require'luasnip'.lsp_expand(args.body)
					end
				},

				sources = {
					{ name = 'luasnip' },
					-- more sources
				},
			}
		end,
		"saadparwaiz1/cmp_luasnip",
	},
	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
		},
		lazy = false,
	},
	{
		-- init.lua:
		{
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
		}
	},
	{
		{
			'goolord/alpha-nvim',
			dependencies = { 'nvim-tree/nvim-web-devicons' },
			config = function ()
				require'alpha'.setup(require'alpha.themes.hvmegy'.config)
			end
		}
	},
	{
		"barrett-ruth/live-server.nvim",
		config = function ()
			require('live-server').setup()
		end
	},
	{
		"christoomey/vim-tmux-navigator",
	},
}

require("lazy").setup(plugins, opts)


