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
	{ "nvim-lua/plenary.nvim", commit = "267282a9ce242bbb0c5dc31445b6d353bed978bb" }, -- Useful lua functions used ny lots of plugins
	{ "windwp/nvim-autopairs", commit = "ae5b41ce880a6d850055e262d6dfebd362bb276e" }, -- Autopairs, integrates with both cmp and treesitter
	{ "numToStr/Comment.nvim", commit = "0236521ea582747b58869cb72f70ccfa967d2e89" }, -- Easily comment stuff
	{ "nvim-neo-tree/neo-tree.nvim", commit = "7e2a3caf999e2028abb643eb0472f351b2777591" },
	{
		"nvim-neo-tree/neo-tree.nvim", commit = "7e2a3caf999e2028abb643eb0472f351b2777591",
		dependencies = {
			"nvim-lua/plenary.nvim", commit = "267282a9ce242bbb0c5dc31445b6d353bed978bb",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim", commit = "c8de23342caf8d50b15d6b28368d36a56a69d76f",
			{
				"s1n7ax/nvim-window-picker", commit = "fd5d3348b3e254ca3134f97793b4a8c702c4ad1d",
				version = "2.*",
			},
		},
	},
	{ "akinsho/bufferline.nvim", commit = "417b303328118b6d836ae330142e88771c48a8a3" },
	{ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" },
	{ "nvim-lualine/lualine.nvim", commit = "45e27ca739c7be6c49e5496d14fcf45a303c3a63" },
	{ "akinsho/toggleterm.nvim", commit = "12cba0a1967b4f3f31903484dec72a6100dcf515" },
	{ "lukas-reineke/indent-blankline.nvim", commit = "4541d690816cb99a7fc248f1486aa87f3abce91c", main = "ibl" },
	{ "goolord/alpha-nvim", commit = "8e05626e073a5a60ffeb8139076520c1eda41d59" },
	{ "folke/which-key.nvim", commit = "7ccf476ebe0445a741b64e36c78a682c1c6118b7" },
	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	{ "shaunsingh/solarized.nvim", commit = "fe02ed49cc017cc93657bd6306a2624394611c69" },
	{ "patstockwell/vim-monokai-tasty", commit = "8c1052347dd204a83ef72f7af36bdf2fa6861e0b" },

	-- cmp plugins
	{ "hrsh7th/nvim-cmp", commit = "51f1e11a89ec701221877532ee1a23557d291dd5" }, -- The completion plugin
	{ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }, -- buffer completions
	{ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }, -- path completions
	{ "hrsh7th/cmp-cmdline", commit = "8ee981b4a91f536f52add291594e89fb6645e451" }, -- cmdline completions
	{ "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }, -- snippet completions
	{ "hrsh7th/cmp-nvim-lsp", commit = "44b16d11215dce86f253ce0c30949813c0a90765" },

	-- snippets
	{ "L3MON4D3/LuaSnip", commit = "409535b8fc54c650eb845b0c35e0cc7f08810284" }, --snippet engine
	{ "rafamadriz/friendly-snippets", commit = "377d45475b49e37460a902d6d569d2093d4037d0" }, -- a bunch of snippets to use

	-- LSP

	{ "neovim/nvim-lspconfig", commit = "0d29cad8de3b2c654315203fc1fe12fde722a18a" }, -- enable LSP
	{ "williamboman/mason.nvim", commit = "74eac861b013786bf231b204b4ba9a7d380f4bd9" },
	{ "williamboman/mason-lspconfig.nvim", commit = "e86a4c84ff35240639643ffed56ee1c4d55f538e" },
	{ "jose-elias-alvarez/null-ls.nvim", commit = "0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7" }, -- for formatters and linters
	{ "RRethy/vim-illuminate", commit = "5ed17582a8e97bf0a0c617c3cf762e98f87b9859" },
	{
		"kevinhwang91/nvim-ufo", commit = "aebd36bf5447862671356fcd5d4a8708ce6c9470",

		dependencies = { "kevinhwang91/promise-async", commit = "e94f35161b8c5d4a4ca3b6ff93dd073eb9214c0e" },
	},

	-- Telescope
	{ "nvim-telescope/telescope.nvim", commit = "2d92125620417fbea82ec30303823e3cd69e90e8" },
	{ "nvim-telescope/telescope-file-browser.nvim", commit = "ad7b637c72549713b9aaed7c4f9c79c62bcbdff0" },
	{ "lytex/telescope-live-grep-args.nvim", commit = "2f8dd161ed138cac596b948d187f8823799cc5c4" },
	{
		"nvim-telescope/telescope-fzf-native.nvim", commit = "9bc8237565ded606e6c366a71c64c0af25cd7a50",

		build = "make",
	},

	-- Projects
	{ "nvim-telescope/telescope-project.nvim", commit = "7c64b181dd4e72deddcf6f319e3bf1e95b2a2f30" },
	{ "olimorris/persisted.nvim", commit = "315cd1a8a501ca8e0c1d55f0c245b9cc0e1ffa01" }, -- Persistence of folds and cursor position
	{ "crusj/bookmarks.nvim", commit = "11a119791b44372eaca977136754f587b19af581" }, -- Per project bookmarks
	{
		"jenterkin/vim-autosource", commit = "569440e157d6eb37fb098dfe95252533553a56f5",

		config = function()
			vim.g.autosource_hashdir = os.getenv("HOME") .. "/.cache/vim-autosource/hashes"
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter", commit = "11d79aa0f731439f2cd05579a64ac13857002f16",

		build = ":TSUpdate",
	},
	-- See TS syntax tree along with the current file
	{ "nvim-treesitter/playground", commit = "2b81a018a49f8e476341dfcb228b7b808baba68b" },
	{ "JoosepAlviste/nvim-ts-context-commentstring", commit = "e9062e2dfb9854e6a927370f2d720de354c88524" },
	{
		"https://gitlab.com/HiPhish/nvim-ts-rainbow2",
	},
	{
		"ThePrimeagen/refactoring.nvim", commit = "5359e74291164fcaeaaecdea9ba753ad54eb53d0",

		dependencies = {
			{ "nvim-lua/plenary.nvim", commit = "267282a9ce242bbb0c5dc31445b6d353bed978bb" },
			{ "nvim-treesitter/nvim-treesitter", commit = "11d79aa0f731439f2cd05579a64ac13857002f16" },
		},
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects", commit = "9e519b6146512c8e2e702faf8ac48420f4f5deec" },

	-- Git
	{ "lewis6991/gitsigns.nvim", commit = "4b3165b5f7b05a3381cea8baf064260bc4c9d330" },

	-- DAP
	--[[ { "mfussenegger/nvim-dap" }, ]]
	--[[ { "rcarriga/nvim-dap-ui" }, ]]
	--[[ { "ravenxrz/DAPInstall.nvim" }, ]]

	-- Not used for keybindings, only to evaluate lua code
	{ "mrjones2014/legendary.nvim", commit = "3db15cae08d63bab40d0c38474e368f97414f090" },

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
	{ "tpope/vim-abolish", commit = "cb3dcb220262777082f63972298d57ef9e9455ec" },
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
		"kana/vim-textobj-entire", commit = "64a856c9dff3425ed8a863b9ec0a21dbaee6fb3a",

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
		"nikvdp/neomux", commit = "c3d253864784fdb33cc5013b7afc4f0910e2cac3",

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

	{ "tidalcycles/vim-tidal", commit = "e440fe5bdfe07f805e21e6872099685d38e8b761" },

	-- neovim in the browser
	{
		"glacambre/firenvim", commit = "1acdf0270bdd9b83a876a15c99dca3c9b40fbaa5",

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
