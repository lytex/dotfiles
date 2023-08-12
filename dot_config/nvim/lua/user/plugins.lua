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
vim.cmd([[
  augroup lazy_user_config
    autocmd!
    autocmd BufWritePost plugins.lua Lazy update
  augroup end
]])

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
	{ "nvim-lua/plenary.nvim", commit = "253d34830709d690f013daf2853a9d21ad7accab" }, -- Useful lua functions used ny lots of plugins
	{ "windwp/nvim-autopairs", commit = "0fd6519d44eac3a6736aafdb3fe9da916c3701d4" }, -- Autopairs, integrates with both cmp and treesitter
	{ "numToStr/Comment.nvim", commit = "8d3aa5c22c2d45e788c7a5fe13ad77368b783c20" }, -- Easily comment stuff
	{ "kyazdani42/nvim-web-devicons", commit = "0568104bf8d0c3ab16395433fcc5c1638efc25d4" },
	{ "kyazdani42/nvim-tree.lua", commit = "d1410cb0896a3aad5d84ddc54284774a627c6d63" },
	{ "akinsho/bufferline.nvim", commit = "ef4fdc5cea3473801dce89b5fdfe633380c80c65" },
	{ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" },
	{ "nvim-lualine/lualine.nvim", commit = "c28a7427c3fb29322db136f0564ec58807b26747" },
	{ "akinsho/toggleterm.nvim", commit = "b86982429325112d2b20c6d0cc7a5c4b182ab705" },
	{ "lukas-reineke/indent-blankline.nvim", commit = "018bd04d80c9a73d399c1061fa0c3b14a7614399" },
	{ "goolord/alpha-nvim", commit = "dafa11a6218c2296df044e00f88d9187222ba6b0" },
	{ "folke/which-key.nvim", commit = "4b73390eec680b4c061ea175eb32c0ff3412271d" },
	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	{ "shaunsingh/solarized.nvim", commit = "34c2245a6ddfd85766f6127768f6b04b0ae2f84a" },
	{ "patstockwell/vim-monokai-tasty", commit = "8c1052347dd204a83ef72f7af36bdf2fa6861e0b" },

	-- cmp plugins
	{ "hrsh7th/nvim-cmp", commit = "777450fd0ae289463a14481673e26246b5e38bf2" }, -- The completion plugin
	{ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }, -- buffer completions
	{ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }, -- path completions
	{ "hrsh7th/cmp-cmdline", commit = "8fcc934a52af96120fe26358985c10c035984b53" }, -- cmdline completions
	{ "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }, -- snippet completions
	{ "hrsh7th/cmp-nvim-lsp", commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef" },

	-- snippets
	{ "L3MON4D3/LuaSnip", commit = "bc8ec05022743d3f08bda7a76c6bb5e9a9024581" }, --snippet engine
	{ "rafamadriz/friendly-snippets", commit = "8d91ba2dc2421a54981115f61b914974f938fa77" }, -- a bunch of snippets to use

	-- LSP

	{ "neovim/nvim-lspconfig", commit = "1ec6f5cbf6ffc44c84783d70039df5295ca22b4e" }, -- enable LSP
	{ "williamboman/mason.nvim", commit = "489f22baed01c28e4b5ee163d36063f0db71346e" },
	{ "williamboman/mason-lspconfig.nvim", commit = "a5ca8b03972b347b74b2ad2f7f23f120a514593b" },
	{ "jose-elias-alvarez/null-ls.nvim", commit = "5855128178fa78293acdfb5b4e41ef046779240b" }, -- for formatters and linters
	{ "RRethy/vim-illuminate", commit = "d6ca7f77eeaf61b3e6ce9f0e5a978d606df44298" },
	{
		"kevinhwang91/nvim-ufo",
		commit = "9e829d5cfa3de6a2ff561d86399772b0339ae49d",

		dependencies = { "kevinhwang91/promise-async", commit = "7fa127fa80e7d4d447e0e2c78e99af4355f4247b" },
	},

	-- Telescope
	{ "nvim-telescope/telescope.nvim", commit = "276362a8020c6e94c7a76d49aa00d4923b0c02f3" },
	{ "nvim-telescope/telescope-file-browser.nvim", commit = "e0fcb12702ad0d2873544a31730f9aaef04fd032" },
	{ "lytex/telescope-live-grep-args.nvim", commit = "2f8dd161ed138cac596b948d187f8823799cc5c4" },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		commit = "580b6c48651cabb63455e97d7e131ed557b8c7e2",

		build = "make",
	},

	-- Projects
	{ "nvim-telescope/telescope-project.nvim", commit = "7c64b181dd4e72deddcf6f319e3bf1e95b2a2f30" },
	{ "olimorris/persisted.nvim", commit = "e053ff33488431dc5bf9239b08650e650ec67292" }, -- Persistence of folds and cursor position
	{ "crusj/bookmarks.nvim", commit = "6f34f1e18bb44c3fc2a0b003d01a7115c84331d9" }, -- Per project bookmarks
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
		commit = "584ccea56e2d37b31ba292da2b539e1a4bb411ca",

		build = ":TSUpdate",
	},
	-- See TS syntax tree along with the current file
	{ "nvim-treesitter/playground", commit = "db54848c7d878965bc31237059841f4e91e9de93" },
	{ "JoosepAlviste/nvim-ts-context-commentstring", commit = "729d83ecb990dc2b30272833c213cc6d49ed5214" },
	{
		"https://gitlab.com/HiPhish/nvim-ts-rainbow2",
		commit = "5becf2cec4b8e06b6df745cf515ac35c6c2e6308",
	},
	{
		"ThePrimeagen/refactoring.nvim",
		commit = "6d0315d3a9bf979d564e9cd17004029d57720a46",

		dependencies = {
			{ "nvim-lua/plenary.nvim", commit = "253d34830709d690f013daf2853a9d21ad7accab" },
			{ "nvim-treesitter/nvim-treesitter", commit = "584ccea56e2d37b31ba292da2b539e1a4bb411ca" },
		},
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects", commit = "b55fe6175f0001347a433c9df358c8cbf8a4e90f" },

	-- Git
	{ "lewis6991/gitsigns.nvim", commit = "372d5cb485f2062ac74abc5b33054abac21d8b58" },

	-- DAP
	--[[ { "mfussenegger/nvim-dap" }, ]]
	--[[ { "rcarriga/nvim-dap-ui" }, ]]
	--[[ { "ravenxrz/DAPInstall.nvim" }, ]]

	-- Not used for keybindings, only to evaluate lua code
	{ "mrjones2014/legendary.nvim", commit = "3563c43bd4e8eba7986f82340bccdba28727d708" },

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
	{ "tpope/vim-abolish", commit = "7a05efb84e6068a0b0801d736b58fc645e5cdfd2" },
	-- use <EasyMotion-prefix> <motion> to highlight possible motions (jk, web, ...)
	{ "easymotion/vim-easymotion", commit = "b3cfab2a6302b3b39f53d9fd2cd997e1127d7878" },
	-- motions like f, t using 2 characters
	{ "justinmk/vim-sneak", commit = "93395f5b56eb203e4c8346766f258ac94ea81702" },
	-- highlight posible f, t motions
	{ "unblevable/quick-scope", commit = "a147fe0b180479249a6770eac332e2cd8f35b673" },
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
		commit = "74415f819edc9306e1955ec27cd5fa36cf33e13e",
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

	-- Get statistics about vim usage
	--[[ { "ActivityWatch/aw-watcher-vim",  }, ]]

	-- Movements for python and space indented languages
	{ "jeetsukumaran/vim-pythonsense", commit = "9200a57629c904ed2ab8c9b2e8c5649d311794ba" },
	{ "michaeljsmith/vim-indent-object", commit = "5c5b24c959478929b54a9e831a8e2e651a465965" },
	{ "jeetsukumaran/vim-indentwise", commit = "608bd6876d3b56d469e0e615eb774a6e06095dbf" },

	-- neovim in the browser
	{
		"glacambre/firenvim",
		commit = "ee4ef314bd990b2b05b7fbd95b857159e444a2fe",
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
