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

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup lazy_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua Lazy update
--   augroup end
-- ]])

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

-- Have packer use a popup window
-- lazy.init({
-- 	display = {
-- 		open_fn = function()
-- 			return require("packer.util").float({ border = "rounded" })
-- 		end,
-- 	},
-- })

-- Install your plugins here
return lazy.setup({
	-- My plugins here
	{ "nvim-lua/plenary.nvim", commit = "55d9fe89e33efd26f532ef20223e5f9430c8b0c0" }, -- Useful lua functions used ny lots of plugins
	{ "windwp/nvim-autopairs", commit = "9fd41181693dd4106b3e414a822bb6569924de81" }, -- Autopairs, integrates with both cmp and treesitter
	{ "numToStr/Comment.nvim", commit = "0236521ea582747b58869cb72f70ccfa967d2e89" }, -- Easily comment stuff
	{
		"nvim-neo-tree/neo-tree.nvim",
		commit = "396ff81e6bb384b0ef12ae427346cbf97d08f808",

		dependencies = {
			{ "nvim-lua/plenary.nvim", commit = "55d9fe89e33efd26f532ef20223e5f9430c8b0c0" },
			{ "nvim-tree/nvim-web-devicons", commit = "3e24abe1ae66532135cec911562f553fe247cb56" }, -- not strictly required, but recommended
			{ "MunifTanjim/nui.nvim", commit = "35da9ca1de0fc4dda96c2e214d93d363c145f418" },
			{
				"s1n7ax/nvim-window-picker",
				commit = "41cfaa428577c53552200a404ae9b3a0b5719706",

				version = "2.*",
			},
		},
	},
	{ "akinsho/bufferline.nvim", commit = "e48ce1805697e4bb97bc171c081e849a65859244" },
	{ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" },
	{ "nvim-lualine/lualine.nvim", commit = "566b7036f717f3d676362742630518a47f132fff" },
	{ "akinsho/toggleterm.nvim", commit = "e3805fed94d487b81e9c21548535cc820f62f840" },
	{ "lukas-reineke/indent-blankline.nvim", commit = "3c8a185da4b8ab7aef487219f5e001b11d4b6aaf", main = "ibl" },
	{ "goolord/alpha-nvim", commit = "29074eeb869a6cbac9ce1fbbd04f5f5940311b32" },
	{ "folke/which-key.nvim", commit = "4433e5ec9a507e5097571ed55c02ea9658fb268a" },
	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	{ "shaunsingh/solarized.nvim", commit = "fe02ed49cc017cc93657bd6306a2624394611c69" },
	{ "patstockwell/vim-monokai-tasty", commit = "6cb799d994d567561328d6c4eb66f20185dacc45" },
	{ "norcalli/nvim-colorizer.lua", commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" },

	-- cmp plugins
	{ "hrsh7th/nvim-cmp", commit = "538e37ba87284942c1d76ed38dd497e54e65b891" }, -- The completion plugin
	{ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }, -- buffer completions
	{ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }, -- path completions
	{ "hrsh7th/cmp-cmdline", commit = "8ee981b4a91f536f52add291594e89fb6645e451" }, -- cmdline completions
	{ "saadparwaiz1/cmp_luasnip", commit = "05a9ab28b53f71d1aece421ef32fee2cb857a843" }, -- snippet completions
	{ "hrsh7th/cmp-nvim-lsp", commit = "5af77f54de1b16c34b23cba810150689a3a90312" },

	-- snippets
	{ "L3MON4D3/LuaSnip", commit = "68153ebb03e65d8a437c6240553645c57f17cf99" }, --snippet engine
	{ "rafamadriz/friendly-snippets", commit = "53d3df271d031c405255e99410628c26a8f0d2b0" }, -- a bunch of snippets to use

	-- LSP

	{ "neovim/nvim-lspconfig", commit = "ce0e625df61be77abe1340fbc9afe9ad39b31dd8" }, -- enable LSP
	{ "williamboman/mason.nvim", commit = "a09da6ac634926a299dd439da08bdb547a8ca011" },
	{ "williamboman/mason-lspconfig.nvim", commit = "56e435e09f8729af2d41973e81a0db440f8fe9c9" },
	{ "nvimtools/none-ls.nvim", commit = "fbdcbf8e152529af846b3a333f039751829b84c2" }, -- for formatters and linters
	{
		"RRethy/vim-illuminate",
		commit = "3bd2ab64b5d63b29e05691e624927e5ebbf0fb86",
	},
	{
		"kevinhwang91/nvim-ufo",
		commit = "c6d88523f574024b788f1c3400c5d5b9bb1a0407",

		dependencies = { "kevinhwang91/promise-async", commit = "94f6f03c6c1e2aab551aacdf0c1e597a7269abb6" },
	},

	-- Telescope
	{ "nvim-telescope/telescope.nvim", commit = "87e92ea31b2b61d45ad044cf7b2d9b66dad2a618" },
	{ "nvim-telescope/telescope-file-browser.nvim", commit = "4bd5657b14b58e069287f5ac591a647bb860b2ed" },
	{ "lytex/telescope-live-grep-args.nvim", commit = "2f8dd161ed138cac596b948d187f8823799cc5c4" },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		commit = "6c921ca12321edaa773e324ef64ea301a1d0da62",

		build = "make",
	},

	-- Projects
	{ "lytex/telescope-project.nvim", commit = "9237849feb8206b82d1d0b88c9eda4d11b5ffe03" },
	{ "olimorris/persisted.nvim", commit = "4e255cd85c7df9dea31500eeee012464c5645267" }, -- Persistence of folds and cursor position
	{ "crusj/bookmarks.nvim", commit = "67b1678872c2772ef7d8cf1a87858c8b8fe7e03b" }, -- Per project bookmarks
	{
		"jenterkin/vim-autosource",
		commit = "569440e157d6eb37fb098dfe95252533553a56f5",

		config = function()
			vim.g.autosource_hashdir = os.getenv("HOME") .. "/.cache/vim-autosource/hashes"
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		commit = "49f1b9a7efc794be143f7ddcd60ce18e8164a7f8",

		build = ":TSUpdate",
	},
	-- See TS syntax tree along with the current file
	{ "nvim-treesitter/playground", commit = "ba48c6a62a280eefb7c85725b0915e021a1a0749" },
	{ "JoosepAlviste/nvim-ts-context-commentstring", commit = "1277b4a1f451b0f18c0790e1a7f12e1e5fdebfee" },
	{
		"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
		commit = "35530b4ad48f01bdaa852da34e4de9930fb54c89",
	},
	{
		"ThePrimeagen/refactoring.nvim",
		commit = "28c5a33a0c489eb559396d9424b042ccfdb03b14",

		dependencies = {
			{ "nvim-lua/plenary.nvim", commit = "55d9fe89e33efd26f532ef20223e5f9430c8b0c0" },
			{ "nvim-treesitter/nvim-treesitter", commit = "49f1b9a7efc794be143f7ddcd60ce18e8164a7f8" },
		},
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects", commit = "85b9d0cbd4ff901abcda862b50dbb34e0901848b" },

	-- Git
	{ "lewis6991/gitsigns.nvim", commit = "3e6e91b09f0468c32d3b96dcacf4b947f037ce25" },

	-- DAP
	--[[ { "mfussenegger/nvim-dap" }, ]]
	--[[ { "rcarriga/nvim-dap-ui" }, ]]
	--[[ { "ravenxrz/DAPInstall.nvim" }, ]]

	-- Not used for keybindings, only to evaluate lua code
	{ "mrjones2014/legendary.nvim", commit = "234e2ef8dec65db153c63a8b310c74155bb93ee7" },

	-- Conflict markers highlighted
	{ "rhysd/conflict-marker.vim", commit = "11a4d42244755505b66b15cd4496a150432eb5e3" },

	-- Vim movements & commands
	-- Surround an object with a character
	{ "tpope/vim-surround", commit = "3d188ed2113431cf8dac77be61b842acb64433d9" },
	-- Define pairs of mappings [<cmd> ]<cmd> that do <cmd> forwards and backwards
	{ "tpope/vim-unimpaired", commit = "6d44a6dc2ec34607c41ec78acf81657248580bf1" },
	-- Repeat vim-unimpaired and vim-surround commands
	{ "tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" },
	-- Case preserving substitution and more
	{ "tpope/vim-abolish", commit = "dcbfe065297d31823561ba787f51056c147aa682" },
	-- use <EasyMotion-prefix> <motion> to highlight possible motions (jk, web, ...)
	{ "easymotion/vim-easymotion", commit = "b3cfab2a6302b3b39f53d9fd2cd997e1127d7878" },
	-- motions like f, t using 2 characters
	{ "justinmk/vim-sneak", commit = "29ec9167d4a609f74c130b46265aa17eb2736e6a" },
	-- highlight posible f, t motions
	{ "unblevable/quick-scope", commit = "256d81e391a22eeb53791ff62ce65f870418fa71" },
	-- Movements inside () [] {} , and more
	{ "wellle/targets.vim", commit = "642d3a4ce306264b05ea3219920b13ea80931767" },
	-- Work with arguments also
	{ "PeterRincker/vim-argumentative", commit = "63a5f7deb675c38126de626f4c00e000902462fe" },
	-- https://github.com/AndrewRadev/sideways.vim Also good
	{
		"kana/vim-textobj-entire",
		commit = "64a856c9dff3425ed8a863b9ec0a21dbaee6fb3a",

		dependencies = { "kana/vim-textobj-user", commit = "41a675ddbeefd6a93664a4dc52f302fe3086a933" },
	},
	{ "junegunn/vim-easy-align", commit = "12dd6316974f71ce333e360c0260b4e1f81169c3" },

	-- syntax highlighting and more for most languages
	{ "sheerun/vim-polyglot", commit = "bc8a81d3592dab86334f27d1d43c080ebf680d42" },

	{ "machakann/vim-highlightedyank", commit = "fa3f57b097e9521ce41a66b6c7cf5d9adea70ea3" },
	-- Auto insertion of [], {}, (), "" keeping the cursor in the middle
	{ "jiangmiao/auto-pairs", commit = "39f06b873a8449af8ff6a3eee716d3da14d63a76" },

	-- Smooth C-u, C-d and more
	{ "psliwka/vim-smoothie", commit = "df1e324e9f3395c630c1c523d0555a01d2eb1b7e" },

	-- Fancy tabbed terminal emulator to run multiple shell windows and only one neovim instance (neovim-remote)
	{
		"nikvdp/neomux",
		commit = "c3d253864784fdb33cc5013b7afc4f0910e2cac3",

		keys = {
			{ " tr", "<cmd>lua require('lazy').load({plugins = 'neomux'})<cr><cmd>Neomux<cr>", desc = "Neomux" },
			{ "<C-w>t", "lua require('lazy').load({plugins = 'neomux'})<cmd>split<CR><cmd>call NeomuxTerm()<CR>" },
			{ "<C-w>T", "lua require('lazy').load({plugins = 'neomux'})<cmd>vsplit<CR><cmd>call NeomuxTerm()<CR>" },
		},
	},
	-- Better tab management
	{ "gcmt/taboo.vim", commit = "caf948187694d3f1374913d36f947b3f9fa1c22f" },
	-- Interactive terminal
	{ "metakirby5/codi.vim", commit = "83b9859aaf8066d95892e01eb9c01571a4b325dd" },

	{ "christianrondeau/vim-base64", commit = "d15253105f6a329cd0632bf9dcbf2591fb5944b8" },

	-- Get statistics about vim usage
	--[[ { "ActivityWatch/aw-watcher-vim",  }, ]]

	-- Movements for python and space indented languages
	{ "jeetsukumaran/vim-pythonsense", commit = "9200a57629c904ed2ab8c9b2e8c5649d311794ba", ft = { "python" } },
	{ "michaeljsmith/vim-indent-object", commit = "5c5b24c959478929b54a9e831a8e2e651a465965", ft = { "python" } },
	{ "jeetsukumaran/vim-indentwise", commit = "608bd6876d3b56d469e0e615eb774a6e06095dbf", ft = { "python" } },

	{ "tidalcycles/vim-tidal", commit = "e440fe5bdfe07f805e21e6872099685d38e8b761" },

	{ "PontusHanssen/pddl.vim", commit = "c7ff45feeba1789dd538c1b8dac00ae8ca9239be", ft = { "lisp", "pddl" } },
	{
		"gpanders/nvim-parinfer",
		ft = { "lisp", "fennel", "clojure", "racket", "pddl" },
		commit = "5ca09287ab3f4144f78ff7977fabc27466f71044",
	},

	-- neovim in the browser
	{
		"glacambre/firenvim",
		commit = "1acdf0270bdd9b83a876a15c99dca3c9b40fbaa5",

		cond = not not vim.g.started_by_firenvim,
		build = function()
			require("lazy").load({ plugins = "firenvim", wait = true })
			vim.fn["firenvim#install"](0)
		end,
	},

	-- {
	-- 	"nvim-orgmode/orgmode",
	-- 	config = function()
	-- 		require("orgmode").setup({})
	-- 	end,
	-- },

	-- use("axvr/org.vim")
	-- use({
	-- 	"nvim-orgmode/orgmode",
	-- 	ft = { "org" },
	-- 	config = function()
	-- 		require("orgmode").setup({})
	-- 	end,
	-- })

	-- misc
	{ "ThePrimeagen/vim-be-good", commit = "c290810728a4f75e334b07dc0f3a4cdea908d351" },
})
