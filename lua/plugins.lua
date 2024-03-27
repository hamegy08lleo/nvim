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
	-- colorscheme
	{ 
		"nyoom-engineering/oxocarbon.nvim",
		"catppuccin/nvim",
		"ful1e5/onedark.nvim",
		-- Add in any other configuration; 
		--   event = foo, 
		--   config = bar
		--   end,
		"ellisonleao/gruvbox.nvim",
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
		-- "voldikss/vim-floaterm",
		"numToStr/FTerm.nvim",
	},
	{
		"pocco81/auto-save.nvim",
	},
	{
		"L3MON4D3/LuaSnip",
		init = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_vscode").lazy_load({ paths =  "./my_snippets/" })
		end,
		dependencies = { 
			"rafamadriz/friendly-snippets",
		},
		build = "make install_jsregexp"
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
	{
		"nvim-treesitter/nvim-treesitter",
	},
	-- lazy.nvim
	{
		-- "folke/noice.nvim",
		-- event = "VeryLazy",
		-- opts = {
		-- 	-- add any options here
		-- 	presets = { 
		-- 		bottom_search = false, -- use a classic bottom cmdline for search
		-- 		-- command_palette = true, -- position the cmdline and popupmenu together
		-- 		-- long_message_to_split = true, -- long messages will be sent to a split
		-- 		-- inc_rename = false, -- enables an input dialog for inc-rename.nvim
		-- 		lsp_doc_border = true, -- add a border to hover docs and signature help
		-- 	}
		-- },
		-- dependencies = {
		-- 	-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		-- 	"MunifTanjim/nui.nvim",
		-- 	-- OPTIONAL:
		-- 	--   `nvim-notify` is only needed, if you want to use the notification view.
		-- 	--   If not available, we use `mini` as the fallback
		-- 	"rcarriga/nvim-notify",
		-- }
	},
	{
		"tpope/vim-fugitive"
	},
	{
		'rose-pine/neovim', name = 'rose-pine'
	},
	{
		"lukas-reineke/indent-blankline.nvim",
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",  -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
		--   "BufReadPre path/to/my-vault/**.md",
		--   "BufNewFile path/to/my-vault/**.md",
		-- },
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",

			-- see below for full list of optional dependencies 👇
		},
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "~/vaults/personal",
				},
				{
					name = "work",
					path = "~/vaults/work",
				},
			},

			-- see below for full list of options 👇
		},
	}
}

require("lazy").setup(plugins, opts)



