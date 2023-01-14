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
	use({ "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" }) -- Have packer manage itself
	use({ "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" }) -- An implementation of the Popup API from vim in Neovim
	use({ "nvim-lua/plenary.nvim", commit = "9e7c62856e47053ec7b17f82c5da0f1e678d92c8" }) -- Useful lua functions used ny lots of plugins
	use({ "windwp/nvim-autopairs", commit = "14cc2a4fc6243152ba085cc2059834113496c60a" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", commit = "d9cfae1059b62f7eacc09dba181efe4894e3b086" }) -- Easily comment stuff
	use({ "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" })
	use({ "kyazdani42/nvim-tree.lua", commit = "45d386a3591f87390390c0d718a81e05895465ca" })
	use({ "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" })
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	use({ "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" })
	use({ "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" })
	use({ "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" })
	use({ "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" })
	use({ "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" })
	use({ "antoinemadec/FixCursorHold.nvim", commit = "70a9516a64668cbfe59f31b66d0a21678c5e9b12" }) -- This is needed to fix lsp doc highlight
	use({ "folke/which-key.nvim", commit = "6885b669523ff4238de99a7c653d47b081b5506d" })
	use({ "olimorris/persisted.nvim", commit = "8fa9328e121403336dc91b6ea3184b87b4c8fbe5" })
	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	use({ "shaunsingh/solarized.nvim", commit = "34c2245a6ddfd85766f6127768f6b04b0ae2f84a" })
	use({ "patstockwell/vim-monokai-tasty", commit = "13a0d38fea1e21fa39deb27fafcfa35335ccc2f4" })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp", commit = "2427d06b6508489547cd30b6e86b1c75df363411" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }) -- path completions
	use({ "hrsh7th/cmp-cmdline", commit = "c66c379915d68fb52ad5ad1195cdd4265a95ef1e" }) -- cmdline completions
	use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })

	-- snippets
	use({ "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" }) --snippet engine
	use({ "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" }) -- a bunch of snippets to use

	-- LSP

	use({ "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" }) -- enable LSP
	use({ "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12" })
	use({ "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" })
	--[[ use({ "williamboman/nvim-lsp-installer", commit = "23820a878a5c2415bfd3b971d1fe3c79e4dd6763" }) -- simple to use language server installer ]]
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "c8624325198513411cf9dcacde76f14d2260220f" }) -- for formatters and linters
	use({
		"kevinhwang91/nvim-ufo",
		commit = "5da70eb121a890df8a5b25e6cc30d88665af97b8",
		requires = { "kevinhwang91/promise-async", commit = "70b09063cdf029079b25c7925e4494e7416ee995" },
	})

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" })
	use({ "nvim-telescope/telescope-project.nvim", commit = "91e9a9737b8522b5a4ecbd8464504da35a1e96cd" })
	use({ "nvim-telescope/telescope-file-browser.nvim", commit = "b1bc53e0da3d26f0003ffb9602115ce258411aa5" })
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		commit = "65c0ee3d4bb9cb696e262bca1ea5e9af3938fc90",

		run = "make",
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "aebc6cf6bd4675ac86629f516d612ad5288f7868",

		run = ":TSUpdate",
	})
	-- See TS syntax tree along with the current file
	use({ "nvim-treesitter/playground", commit = "e6a0bfaf9b5e36e3a327a1ae9a44a989eae472cf" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08" })
	use({
		"https://gitlab.com/HiPhish/nvim-ts-rainbow2",
		commit = "09dcb851701747b3f4c5c1088befc88e1601942d",
	})
	use({
		"ThePrimeagen/refactoring.nvim",
		commit = "c9ca8e3bbf7218101f16e6a03b15bf72b99b2cae",

		requires = {
			{ "nvim-lua/plenary.nvim", commit = "9e7c62856e47053ec7b17f82c5da0f1e678d92c8" },
			{ "nvim-treesitter/nvim-treesitter", commit = "aebc6cf6bd4675ac86629f516d612ad5288f7868" },
		},
	})
	use({ "nvim-treesitter/nvim-treesitter-textobjects", commit = "e2ee8fd7259389deaa898d1216fdc6846a26c627" })

	-- Git
	use({ "lewis6991/gitsigns.nvim", commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f" })

	-- DAP
	--[[ use({ "mfussenegger/nvim-dap" }) ]]
	--[[ use({ "rcarriga/nvim-dap-ui" }) ]]
	--[[ use({ "ravenxrz/DAPInstall.nvim" }) ]]

	-- Not used for keybindings, only to evaluate lua code
	use({ "mrjones2014/legendary.nvim", commit = "7be09ac0cf0ac12d65e41c706822a24eb0b92971" })

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
	use({ "metakirby5/codi.vim", commit = "28983696f59f47221380b4f7d78237dc04f9c62f" })

	-- Get statistics about vim usage
	use({ "ActivityWatch/aw-watcher-vim", commit = "3df3aa78dc10ebb655df652ee1464b27d001f6a2" })

	-- Movements for python and space indented languages
	use({ "jeetsukumaran/vim-pythonsense", commit = "9200a57629c904ed2ab8c9b2e8c5649d311794ba" })
	use({ "michaeljsmith/vim-indent-object", commit = "5c5b24c959478929b54a9e831a8e2e651a465965" })
	use({ "jeetsukumaran/vim-indentwise", commit = "608bd6876d3b56d469e0e615eb774a6e06095dbf" })

	-- neovim in the browser
	use({
		"glacambre/firenvim",
		commit = "a96710eaf6e6c2de78341c32d8dc7b39727ad54c",

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
	use({ "ThePrimeagen/vim-be-good", commit = "a088a4b790e5663af7c1b7a1ed6d239a544a50e8" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
