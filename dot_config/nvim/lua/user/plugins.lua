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
	use({ "wbthomason/packer.nvim", commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422" }) -- Have packer manage itself
	use({ "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" }) -- An implementation of the Popup API from vim in Neovim
	use({ "nvim-lua/plenary.nvim", commit = "968a4b9afec0c633bc369662e78f8c5db0eba249" }) -- Useful lua functions used ny lots of plugins
	use({ "windwp/nvim-autopairs", commit = "4a95b3982be7397cd8e1370d1a09503f9b002dbf" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" }) -- Easily comment stuff
	use({ "kyazdani42/nvim-web-devicons", commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e" })
	use({ "kyazdani42/nvim-tree.lua", commit = "b299a877ad2709a6b036230378b35ab246d71245" })
	use({ "akinsho/bufferline.nvim", commit = "68839d62785edfb4ff7a7b3c1e9f4b64d55749e8" })
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	use({ "nvim-lualine/lualine.nvim", commit = "5113cdb32f9d9588a2b56de6d1df6e33b06a554a" })
	use({ "akinsho/toggleterm.nvim", commit = "8f2e78d0256eba4896c8514aa150e41e63f7d5b2" })
	use({ "lewis6991/impatient.nvim", commit = "969f2c5c90457612c09cf2a13fee1adaa986d350" })
	use({ "lukas-reineke/indent-blankline.nvim", commit = "42fe62eb8792e427b2c7b0e1fa1b0d9597baac89" })
	use({ "goolord/alpha-nvim", commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" })
	use({ "antoinemadec/FixCursorHold.nvim", commit = "1bfb32e7ba1344925ad815cb0d7f901dbc0ff7c1" }) -- This is needed to fix lsp doc highlight
	use({ "folke/which-key.nvim", commit = "bd4411a2ed4dd8bb69c125e339d837028a6eea71" })

	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	use({ "patstockwell/vim-monokai-tasty", commit = "13a0d38fea1e21fa39deb27fafcfa35335ccc2f4" })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp", commit = "1cad1815e165c2b436f41a1ee20327701842a761" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" }) -- path completions
	use({ "hrsh7th/cmp-cmdline", commit = "c36ca4bc1dedb12b4ba6546b96c43896fd6e7252" }) -- cmdline completions
	use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })

	-- snippets
	use({ "L3MON4D3/LuaSnip", commit = "a12441e0598e93e67235eba67c8e6fbffc896f06" }) --snippet engine
	use({ "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig", commit = "9278dfbb92f8e99c313ce58ddcff92bd0bce5c0c" }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer", commit = "ed999f0a555e83932f8e400c8830679c0bb499b8" }) -- simple to use language server installer
	use({ "tamago324/nlsp-settings.nvim", commit = "a06cdd60b81bbfa6512eaf42d672e5ac4e76ddd8" }) -- language server settings defined in json for
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "ff40739e5be6581899b43385997e39eecdbf9465" }) -- for formatters and linters

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", commit = "d88b44ddf14670cffa9fdb1eaca7a0429a973653" })
	use({ "nvim-telescope/telescope-project.nvim", commit = "8cd22b696e14b353fe8ea9648a03364cb56c39d4" })
	use({ "nvim-telescope/telescope-file-browser.nvim", commit = "61a5521853ac739ae3d0d395f52c1178108e0114" })
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		commit = "6a33ecefa9b3d9ade654f9a7a6396a00c3758ca6",
		run = "make",
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "d810c386341fbf0d49895a2cdd6a2b63b945b71a",
		run = ":TSUpdate",
	})
	-- See TS syntax tree along with the current file
	use({ "nvim-treesitter/playground", commit = "ce7e4b757598f1c785ed0fd94fc65959acd7d39c" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269" })
	use({ "p00f/nvim-ts-rainbow", commit = "837167f63445821c55e6eed9dbdac1b0b29afa92" })
	use({
		"ThePrimeagen/refactoring.nvim",
		commit = "f7167900ff3835bb43d279152dc4b83e941b1b55",
		requires = {
			{ "nvim-lua/plenary.nvim", commit = "968a4b9afec0c633bc369662e78f8c5db0eba249" },
			{ "nvim-treesitter/nvim-treesitter", commit = "d810c386341fbf0d49895a2cdd6a2b63b945b71a" },
		},
	})

	-- Git
	use({ "lewis6991/gitsigns.nvim", commit = "4883988cf8b623f63cc8c7d3f11b18b7e81f06ff" })

	-- DAP
	use({ "mfussenegger/nvim-dap", commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d" })
	use({ "rcarriga/nvim-dap-ui", commit = "d76d6594374fb54abf2d94d6a320f3fd6e9bb2f7" })
	use({ "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" })

	-- Not used for keybindings, only to evaluate lua code
	use({ "mrjones2014/legendary.nvim", commit = "3d6cde24296b017412bf8801db6e6777478682eb" })

	-- Conflict markers highlighted
	use({ "rhysd/conflict-marker.vim", commit = "22b6133116795ea8fb6705ddca981aa8faecedda" })

	-- Vim movements & commands
	-- Surround an object with a character
	use({ "tpope/vim-surround", commit = "bf3480dc9ae7bea34c78fbba4c65b4548b5b1fea" })
	-- Define pairs of mappings [<cmd> ]<cmd> that do <cmd> forwards and backwards
	use({ "tpope/vim-unimpaired", commit = "efdc6475f7ea789346716dabf9900ac04ee8604a" })
	-- Repeat vim-unimpaired and vim-surround commands
	use({ "tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" })
	-- Case preserving substitution and more
	use({ "tpope/vim-abolish", commit = "3f0c8faadf0c5b68bcf40785c1c42e3731bfa522" })
	-- use <EasyMotion-prefix> <motion> to highlight possible motions (jk, web, ...)
	use({ "easymotion/vim-easymotion", commit = "b3cfab2a6302b3b39f53d9fd2cd997e1127d7878" })
	-- motions like f, t using 2 characters
	use({ "justinmk/vim-sneak", commit = "94c2de47ab301d476a2baec9ffda07367046bec9" })
	-- highlight posible f, t motions
	use({ "unblevable/quick-scope", commit = "428e8698347f254d24b248af9f656194a80081e5" })
	-- Movements inside () [] {} , and more
	use({ "wellle/targets.vim", commit = "8d6ff2984cdfaebe5b7a6eee8f226a6dd1226f2d" })

	-- syntax highlighting and more for most languages
	use({ "sheerun/vim-polyglot", commit = "38282d58387cff48ac203f6912c05e4c8686141b" })

	use({ "machakann/vim-highlightedyank", commit = "f9db473137ca96c6a989ec3e2b7edf8a3189c448" })
	-- Auto insertion of [], {}, (), "" keeping the cursor in the middle
	use({ "jiangmiao/auto-pairs", commit = "39f06b873a8449af8ff6a3eee716d3da14d63a76" })

	-- Smooth C-u, C-d and more
	use({ "psliwka/vim-smoothie", commit = "df1e324e9f3395c630c1c523d0555a01d2eb1b7e" })

	use({
		"jenterkin/vim-autosource",
		commit = "569440e157d6eb37fb098dfe95252533553a56f5",
		config = function()
			vim.g.autosource_hashdir = os.getenv("HOME") .. "/.cache/vim-autosource/hashes"
		end,
	})

	-- Fancy tabbed terminal emulator to run multiple shell windows and only one neovim instance (neovim-remote)
	use({ "nikvdp/neomux", commit = "7fa6754f3c781ca99fd533217443b1e4f86611d4" })
	-- Better tab management
	use({ "gcmt/taboo.vim", commit = "caf948187694d3f1374913d36f947b3f9fa1c22f" })
	-- Interactive terminal
	use({ "metakirby5/codi.vim", commit = "c120785c950f9991d32d3d4d2f3696fa8a8b5582" })

	-- Get statistics about vim usage
	use({ "ActivityWatch/aw-watcher-vim", commit = "efdf283f879a89dccd5f4ba71a27f43303577aea" })
	-- Integration with Sourcetral (Source code visualization)
	use({ "CoatiSoftware/vim-sourcetrail", commit = "c9c621a7ab81c52a661457ccf33a64fd7c56fd9d" })

	-- Movements for python and space indented languages
	use({ "jeetsukumaran/vim-pythonsense", commit = "9200a57629c904ed2ab8c9b2e8c5649d311794ba" })
	use({ "michaeljsmith/vim-indent-object", commit = "5c5b24c959478929b54a9e831a8e2e651a465965" })

	-- neovim in the browser
	use({
		"glacambre/firenvim",
		commit = "e90f87872b313df15a06119ddbb84cdf1599657c",
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
	use({ "ThePrimeagen/vim-be-good", commit = "bc499a06c14c729b22a6cc7e730a9fbc44d4e737" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
