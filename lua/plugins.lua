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
		"neanias/everforest-nvim",
		config = function () 

			require("everforest").setup({
			---Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
			---Default is "medium".
			background = "hard",
			---How much of the background should be transparent. 2 will have more UI
			---components be transparent (e.g. status line background)
			transparent_background_level = 0,
			---Whether italics should be used for keywords and more.
			italics = false,
			---Disable italic fonts for comments. Comments are in italics by default, set
			---this to `true` to make them _not_ italic!
			disable_italic_comments = false,
			---By default, the colour of the sign column background is the same as the as normal text
			---background, but you can use a grey background by setting this to `"grey"`.
			sign_column_background = "none",
			---The contrast of line numbers, indent lines, etc. Options are `"high"` or
			---`"low"` (default).
			ui_contrast = "low",
			---Dim inactive windows. Only works in Neovim. Can look a bit weird with Telescope.
			---
			---When this option is used in conjunction with show_eob set to `false`, the
			---end of the buffer will only be hidden inside the active window. Inside
			---inactive windows, the end of buffer filler characters will be visible in
			---dimmed symbols. This is due to the way Vim and Neovim handle `EndOfBuffer`.
			dim_inactive_windows = false,
			---Some plugins support highlighting error/warning/info/hint texts, by
			---default these texts are only underlined, but you can use this option to
			---also highlight the background of them.
			diagnostic_text_highlight = false,
			---Which colour the diagnostic text should be. Options are `"grey"` or `"coloured"` (default)
			diagnostic_virtual_text = "coloured",
			---Some plugins support highlighting error/warning/info/hint lines, but this
			---feature is disabled by default in this colour scheme.
			diagnostic_line_highlight = false,
			---By default, this color scheme won't colour the foreground of |spell|, instead
			---colored under curls will be used. If you also want to colour the foreground,
			---set this option to `true`.
			spell_foreground = false,
			---Whether to show the EndOfBuffer highlight.
			show_eob = true,
			---Style used to make floating windows stand out from other windows. `"bright"`
			---makes the background of these windows lighter than |hl-Normal|, whereas
			---`"dim"` makes it darker.
			---
			---Floating windows include for instance diagnostic pop-ups, scrollable
			---documentation windows from completion engines, overlay windows from
			---installers, etc.
			---
			---NB: This is only significant for dark backgrounds as the light palettes
			---have the same colour for both values in the switch.
			float_style = "bright",
			---You can override specific highlights to use other groups or a hex colour.
			---This function will be called with the highlights and colour palette tables.
			---@param highlight_groups Highlights
			---@param palette Palette
			on_highlights = function(highlight_groups, palette) end,
			---You can override colours in the palette to use different hex colours.
			---This function will be called once the base and background colours have
			---been mixed on the palette.
			---@param palette Palette
			colours_override = function(palette) end,
		})
	end
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
	"rafamadriz/friendly-snippets",
	-- load snippets from path/of/your/nvim/config/my-cool-snippets
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
}
}

require("lazy").setup(plugins, opts)



