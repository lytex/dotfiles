local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use({ "wbthomason/packer.nvim", commit = "1d0cf98a561f7fd654c970c49f917d74fafe1530" }) -- Have packer manage itself
	use({ "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" }) -- An implementation of the Popup API from vim in Neovim
	use({ "nvim-lua/plenary.nvim", commit = "253d34830709d690f013daf2853a9d21ad7accab" }) -- Useful lua functions used ny lots of plugins
	use({ "windwp/nvim-autopairs", commit = "0fd6519d44eac3a6736aafdb3fe9da916c3701d4" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", commit = "8d3aa5c22c2d45e788c7a5fe13ad77368b783c20" }) -- Easily comment stuff
	use({ "kyazdani42/nvim-web-devicons", commit = "4ec26d67d419c12a4abaea02f1b6c57b40c08d7e" })
	use({ "kyazdani42/nvim-tree.lua", commit = "d1410cb0896a3aad5d84ddc54284774a627c6d63" })
	use({ "akinsho/bufferline.nvim", commit = "ef4fdc5cea3473801dce89b5fdfe633380c80c65" })
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	use({ "nvim-lualine/lualine.nvim", commit = "c28a7427c3fb29322db136f0564ec58807b26747" })
	use({ "akinsho/toggleterm.nvim", commit = "b86982429325112d2b20c6d0cc7a5c4b182ab705" })
	use({ "lewis6991/impatient.nvim", commit = "c90e273f7b8c50a02f956c24ce4804a47f18162e" })
	use({ "lukas-reineke/indent-blankline.nvim", commit = "018bd04d80c9a73d399c1061fa0c3b14a7614399" })
	use({ "goolord/alpha-nvim", commit = "dafa11a6218c2296df044e00f88d9187222ba6b0" })
	use({ "folke/which-key.nvim", commit = "4b73390eec680b4c061ea175eb32c0ff3412271d" })
	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	use({ "shaunsingh/solarized.nvim", commit = "34c2245a6ddfd85766f6127768f6b04b0ae2f84a" })
	use({ "patstockwell/vim-monokai-tasty", commit = "8c1052347dd204a83ef72f7af36bdf2fa6861e0b" })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp", commit = "777450fd0ae289463a14481673e26246b5e38bf2" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }) -- path completions
	use({ "hrsh7th/cmp-cmdline", commit = "8fcc934a52af96120fe26358985c10c035984b53" }) -- cmdline completions
	use({ "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef" })

	-- snippets
	use({ "L3MON4D3/LuaSnip", commit = "bc8ec05022743d3f08bda7a76c6bb5e9a9024581" }) --snippet engine
	use({ "rafamadriz/friendly-snippets", commit = "8d91ba2dc2421a54981115f61b914974f938fa77" }) -- a bunch of snippets to use

	-- LSP

	use({ "neovim/nvim-lspconfig", commit = "1ec6f5cbf6ffc44c84783d70039df5295ca22b4e" }) -- enable LSP
	use({ "williamboman/mason.nvim", commit = "489f22baed01c28e4b5ee163d36063f0db71346e" })
	use({ "williamboman/mason-lspconfig.nvim", commit = "a5ca8b03972b347b74b2ad2f7f23f120a514593b" })
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "5855128178fa78293acdfb5b4e41ef046779240b" }) -- for formatters and linters
	use({
		"kevinhwang91/nvim-ufo",
		commit = "9e829d5cfa3de6a2ff561d86399772b0339ae49d",

		requires = { "kevinhwang91/promise-async", commit = "7fa127fa80e7d4d447e0e2c78e99af4355f4247b" },
	})

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", commit = "942fe5faef47b21241e970551eba407bc10d9547" })
	use({ "nvim-telescope/telescope-file-browser.nvim", commit = "e0fcb12702ad0d2873544a31730f9aaef04fd032" })
	use({ "lytex/telescope-live-grep-args.nvim", commit = "64046ecfaa0a720554da1138d6042ee0ae9f0614" })
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		commit = "580b6c48651cabb63455e97d7e131ed557b8c7e2",

		run = "make",
	})

	-- Projects
	use({ "lytex/telescope-project.nvim", commit = "8ad5cfb7dc7a499e7e5a7757b544f116fc154e18" })
	use({ "olimorris/persisted.nvim", commit = "e053ff33488431dc5bf9239b08650e650ec67292" }) -- Persistence of folds and cursor position
	use({ "crusj/bookmarks.nvim", commit = "1c95ec30f4b01c45f5b7f36eb495cb56a82f8c5d" }) -- Per project bookmarks
	use({
		"jenterkin/vim-autosource",
		commit = "569440e157d6eb37fb098dfe95252533553a56f5",

		config = function()
			vim.g.autosource_hashdir = os.getenv("HOME") .. "/.cache/vim-autosource/hashes"
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "584ccea56e2d37b31ba292da2b539e1a4bb411ca",

		run = ":TSUpdate",
	})
	-- See TS syntax tree along with the current file
	use({ "nvim-treesitter/playground", commit = "db54848c7d878965bc31237059841f4e91e9de93" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "729d83ecb990dc2b30272833c213cc6d49ed5214" })
	use({
		"https://gitlab.com/HiPhish/nvim-ts-rainbow2",
	})
	use({
		"ThePrimeagen/refactoring.nvim",
		commit = "e7c40818b2995016ede93c5620055206b1aba44f",

		requires = {
			{ "nvim-lua/plenary.nvim", commit = "253d34830709d690f013daf2853a9d21ad7accab" },
			{ "nvim-treesitter/nvim-treesitter", commit = "584ccea56e2d37b31ba292da2b539e1a4bb411ca" },
		},
	})
	use({ "nvim-treesitter/nvim-treesitter-textobjects", commit = "b55fe6175f0001347a433c9df358c8cbf8a4e90f" })

	-- Git
	use({ "lewis6991/gitsigns.nvim", commit = "372d5cb485f2062ac74abc5b33054abac21d8b58" })

	-- DAP
	--[[ use({ "mfussenegger/nvim-dap" }) ]]
	--[[ use({ "rcarriga/nvim-dap-ui" }) ]]
	--[[ use({ "ravenxrz/DAPInstall.nvim" }) ]]

	-- Not used for keybindings, only to evaluate lua code
	use({ "mrjones2014/legendary.nvim", commit = "3563c43bd4e8eba7986f82340bccdba28727d708" })

	-- Conflict markers highlighted
	use({ "rhysd/conflict-marker.vim", commit = "11a4d42244755505b66b15cd4496a150432eb5e3" })

	-- Vim movements & commands
	-- Surround an object with a character
	use({ "tpope/vim-surround", commit = "3d188ed2113431cf8dac77be61b842acb64433d9" })
	-- Define pairs of mappings [<cmd> ]<cmd> that do <cmd> forwards and backwards
	use({ "tpope/vim-unimpaired", commit = "6d44a6dc2ec34607c41ec78acf81657248580bf1" })
	-- Repeat vim-unimpaired and vim-surround commands
	use({ "tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" })
	-- Case preserving substitution and more
	use({ "tpope/vim-abolish", commit = "7a05efb84e6068a0b0801d736b58fc645e5cdfd2" })
	-- use <EasyMotion-prefix> <motion> to highlight possible motions (jk, web, ...)
	use({ "easymotion/vim-easymotion", commit = "b3cfab2a6302b3b39f53d9fd2cd997e1127d7878" })
	-- motions like f, t using 2 characters
	use({ "justinmk/vim-sneak", commit = "93395f5b56eb203e4c8346766f258ac94ea81702" })
	-- highlight posible f, t motions
	use({ "unblevable/quick-scope", commit = "a147fe0b180479249a6770eac332e2cd8f35b673" })
	-- Movements inside () [] {} , and more
	use({ "wellle/targets.vim", commit = "642d3a4ce306264b05ea3219920b13ea80931767" })
	-- Work with arguments also
	use({ "PeterRincker/vim-argumentative", commit = "63a5f7deb675c38126de626f4c00e000902462fe" })
	-- https://github.com/AndrewRadev/sideways.vim Also good
	use({
		"kana/vim-textobj-entire",
		commit = "64a856c9dff3425ed8a863b9ec0a21dbaee6fb3a",

		requires = { "kana/vim-textobj-user", commit = "41a675ddbeefd6a93664a4dc52f302fe3086a933" },
	})
	use({ "junegunn/vim-easy-align", commit = "12dd6316974f71ce333e360c0260b4e1f81169c3" })

	-- syntax highlighting and more for most languages
	use({ "sheerun/vim-polyglot", commit = "bc8a81d3592dab86334f27d1d43c080ebf680d42" })

	use({ "machakann/vim-highlightedyank", commit = "fa3f57b097e9521ce41a66b6c7cf5d9adea70ea3" })
	-- Auto insertion of [], {}, (), "" keeping the cursor in the middle
	use({ "jiangmiao/auto-pairs", commit = "39f06b873a8449af8ff6a3eee716d3da14d63a76" })

	-- Smooth C-u, C-d and more
	use({ "psliwka/vim-smoothie", commit = "df1e324e9f3395c630c1c523d0555a01d2eb1b7e" })

	-- Fancy tabbed terminal emulator to run multiple shell windows and only one neovim instance (neovim-remote)
	use({ "nikvdp/neomux", commit = "74415f819edc9306e1955ec27cd5fa36cf33e13e" })
	-- Better tab management
	use({ "gcmt/taboo.vim", commit = "caf948187694d3f1374913d36f947b3f9fa1c22f" })
	-- Interactive terminal
	use({ "metakirby5/codi.vim", commit = "83b9859aaf8066d95892e01eb9c01571a4b325dd" })

	-- Get statistics about vim usage
	--[[ use({ "ActivityWatch/aw-watcher-vim",  }) ]]

	-- Movements for python and space indented languages
	use({ "jeetsukumaran/vim-pythonsense", commit = "9200a57629c904ed2ab8c9b2e8c5649d311794ba" })
	use({ "michaeljsmith/vim-indent-object", commit = "5c5b24c959478929b54a9e831a8e2e651a465965" })
	use({ "jeetsukumaran/vim-indentwise", commit = "608bd6876d3b56d469e0e615eb774a6e06095dbf" })

	-- neovim in the browser
	use({
		"glacambre/firenvim",
		commit = "ee4ef314bd990b2b05b7fbd95b857159e444a2fe",

		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	-- use("axvr/org.vim")
	-- use({
	-- 	"nvim-orgmode/orgmode",
	-- 	ft = { "org" },
	-- 	config = function()
	-- 		require("orgmode").setup({})
	-- 	end,
	-- })

	-- misc
	use({ "ThePrimeagen/vim-be-good", commit = "c290810728a4f75e334b07dc0f3a4cdea908d351" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
