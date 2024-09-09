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
	{ "nvim-lua/plenary.nvim", commit = "a3e3bc82a3f95c5ed0d7201546d5d2c19b20d683" }, -- Useful lua functions used ny lots of plugins
	{ "windwp/nvim-autopairs", commit = "e38c5d837e755ce186ae51d2c48e1b387c4425c6" }, -- Autopairs, integrates with both cmp and treesitter
	{ "numToStr/Comment.nvim", commit = "e30b7f2008e52442154b66f7c519bfd2f1e32acb" }, -- Easily comment stuff
	{
		"nvim-neo-tree/neo-tree.nvim",
		commit = "206241e451c12f78969ff5ae53af45616ffc9b72",

		dependencies = {
			{ "nvim-lua/plenary.nvim", commit = "a3e3bc82a3f95c5ed0d7201546d5d2c19b20d683" },
			{ "nvim-tree/nvim-web-devicons", commit = "e612de3d3a41a6b7be47f51e956dddabcbf419d9" }, -- not strictly required, but recommended
			{ "MunifTanjim/nui.nvim", commit = "61574ce6e60c815b0a0c4b5655b8486ba58089a1" },
			{
				"s1n7ax/nvim-window-picker",
				commit = "41cfaa428577c53552200a404ae9b3a0b5719706",

				version = "2.*",
			},
		},
	},
	{ "akinsho/bufferline.nvim", commit = "0b2fd861eee7595015b6561dade52fb060be10c4" },
	{ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" },
	{ "nvim-lualine/lualine.nvim", commit = "544dd1583f9bb27b393f598475c89809c4d5e86b" },
	{ "akinsho/toggleterm.nvim", commit = "8ed0f52006d3207ec6c94de7db62da840937ef2a" },
	{ "lukas-reineke/indent-blankline.nvim", commit = "65e20ab94a26d0e14acac5049b8641336819dfc7", main = "ibl" },
	{ "goolord/alpha-nvim", commit = "41283fb402713fc8b327e60907f74e46166f4cfd" },
	{ "folke/which-key.nvim", commit = "6c1584eb76b55629702716995cca4ae2798a9cca" },
	{ "mbbill/undotree", commit = "56c684a805fe948936cda0d1b19505b84ad7e065" },
	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	{ "shaunsingh/solarized.nvim", commit = "fe02ed49cc017cc93657bd6306a2624394611c69" },
	{ "patstockwell/vim-monokai-tasty", commit = "c585c4ff0744315c6c03fd54afa7c8ca23b039c0" },
	{ "norcalli/nvim-colorizer.lua", commit = "a065833f35a3a7cc3ef137ac88b5381da2ba302e" },
	{ "vim-scripts/AnsiEsc.vim", commit = "d2bb7878622e4c16203acf1c92a0f4bc7ac58003" },

	-- cmp plugins
	{ "hrsh7th/nvim-cmp", commit = "d818fd0624205b34e14888358037fb6f5dc51234" }, -- The completion plugin
	{ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }, -- buffer completions
	{ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }, -- path completions
	{ "hrsh7th/cmp-cmdline", commit = "d250c63aa13ead745e3a40f61fdd3470efde3923" }, -- cmdline completions
	{ "saadparwaiz1/cmp_luasnip", commit = "05a9ab28b53f71d1aece421ef32fee2cb857a843" }, -- snippet completions
	{ "hrsh7th/cmp-nvim-lsp", commit = "39e2eda76828d88b773cc27a3f61d2ad782c922d" },

	-- snippets
	{ "L3MON4D3/LuaSnip", commit = "ce0a05ab4e2839e1c48d072c5236cce846a387bc" }, --snippet engine
	{ "rafamadriz/friendly-snippets", commit = "00ebcaa159e817150bd83bfe2d51fa3b3377d5c4" }, -- a bunch of snippets to use

	-- LSP

	{ "neovim/nvim-lspconfig", commit = "0e301015632c59d15422ee82729e70506ffe54c3" }, -- enable LSP
	{ "williamboman/mason.nvim", commit = "e2f7f9044ec30067bc11800a9e266664b88cda22" },
	{ "williamboman/mason-lspconfig.nvim", commit = "ba9c2f0b93deb48d0a99ae0e8d8dd36f7cc286d6" },
	{
		"nvimtools/none-ls.nvim",
		commit = "a0fe586525eac4247d40076cdb2f1c2f55912171",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
			commit = "059bb6561b8f5ff99a7acc9262b557ebbe5c34ec",
		},
	}, -- for formatters and linters
	{
		"RRethy/vim-illuminate",
		commit = "5eeb7951fc630682c322e88a9bbdae5c224ff0aa",
	},
	{
		"kevinhwang91/nvim-ufo",
		commit = "1b5f2838099f283857729e820cc05e2b19df7a2c",

		dependencies = { "kevinhwang91/promise-async", commit = "28c1d5a295eb5310afa2523d4ae9aa41ec5a9de2" },
	},

	-- Telescope
	{ "nvim-telescope/telescope.nvim", commit = "10b8a82b042caf50b78e619d92caf0910211973d" },
	{ "nvim-telescope/telescope-file-browser.nvim", commit = "8574946bf6d0d820d7f600f3db808f5900a2ae23" },
	{
		"nvim-telescope/telescope-frecency.nvim",
		commit = "f67baca08423a6fd00167801a54db38e0b878063",
	},
	{ "lytex/telescope-live-grep-args.nvim", commit = "2f8dd161ed138cac596b948d187f8823799cc5c4" },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		commit = "cf48d4dfce44e0b9a2e19a008d6ec6ea6f01a83b",

		build = "make",
	},

	-- Projects
	{ "lytex/telescope-project.nvim", commit = "9237849feb8206b82d1d0b88c9eda4d11b5ffe03" },
	{ "olimorris/persisted.nvim", commit = "4df3f8a03690add1bc2f9a79b31e1c43f5e0dd05" }, -- Persistence of folds and cursor position
	{ "crusj/bookmarks.nvim", commit = "e719191ba3ec67d45993a6aed2a7abd7f9fd2459" }, -- Per project bookmarks
	-- {
	-- 	"folke/flash.nvim",
	--
	-- 	event = "VeryLazy",
	-- 	opts = {},
	-- 	-- stylua: ignore
	-- 	keys = {
	-- 		{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
	-- 		{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
	-- 		{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
	-- 		{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
	-- 		{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
	-- 	},
	-- 	-- stylua: ignore end
	-- },
	{
		"jenterkin/vim-autosource",
		commit = "569440e157d6eb37fb098dfe95252533553a56f5",

		config = function()
			vim.g.autosource_hashdir = os.getenv("HOME") .. "/.cache/vim-autosource/hashes"
		end,
	},
	{
		"bloznelis/before.nvim",
		commit = "42294a3ba5dc02d3f3a9fe4e9a033ef29da6dcc6",

		config = function()
			local before = require("before")
			before.setup()

			-- Jump to previous entry in the edit history
			vim.keymap.set("n", "<C-h>", before.jump_to_last_edit, {})

			-- Jump to next entry in the edit history
			vim.keymap.set("n", "<C-l>", before.jump_to_next_edit, {})

			-- Look for previous edits in quickfix list
			vim.keymap.set("n", "<leader>oq", before.show_edits_in_quickfix, {})

			-- Look for previous edits in telescope (needs telescope, obviously)
			vim.keymap.set("n", "<leader>oe", before.show_edits_in_telescope, {})
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		commit = "e0faad4a9e2804d0d9fd5c509289bd630253dfc3",
		lazy = false,
		opts = {
			highlight = { enable = true },
		},
		build = ":TSUpdate",
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring", commit = "6b5f95aa4d24f2c629a74f2c935c702b08dbde62" },
	{
		"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
	},
	{
		"ThePrimeagen/refactoring.nvim",
		commit = "d0f1971ec2f139e495c1ad2312b7b2a8e8a16421",

		dependencies = {
			{ "nvim-lua/plenary.nvim", commit = "a3e3bc82a3f95c5ed0d7201546d5d2c19b20d683" },
			{ "nvim-treesitter/nvim-treesitter", commit = "e0faad4a9e2804d0d9fd5c509289bd630253dfc3" },
		},
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects", commit = "34867c69838078df7d6919b130c0541c0b400c47" },

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		commit = "3e6e91b09f0468c32d3b96dcacf4b947f037ce25",
		commit = "3e6e91b09f0468c32d3b96dcacf4b947f037ce25",
	},
	{ "tpope/vim-fugitive", commit = "0444df68cd1cdabc7453d6bd84099458327e5513" },
	-- Branches of a feather, flog together
	{ "rbong/vim-flog", commit = "83cd74b03d1b2a7122334e277b7a3a188686a59c" },
	{
		"SuperBo/fugit2.nvim",
		opts = {
			width = 100,
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"echasnovski/mini.icons",
			"nvim-lua/plenary.nvim",
			{
				"chrisgrieser/nvim-tinygit", -- optional: for Github PR view
				dependencies = { "stevearc/dressing.nvim" },
			},
		},
		cmd = { "Fugit2", "Fugit2Diff", "Fugit2Graph" },
		keys = {
			{ "<leader>F", mode = "n", "<cmd>Fugit2<cr>" },
		},
	},

	-- DAP
	--[[ { "mfussenegger/nvim-dap" }, ]]
	--[[ { "rcarriga/nvim-dap-ui" }, ]]
	--[[ { "ravenxrz/DAPInstall.nvim" }, ]]

	-- Not used for keybindings, only to evaluate lua code
	{ "mrjones2014/legendary.nvim", commit = "636fb6949799057da599b560a14740355234cc6a" },
	{ "ii14/neorepl.nvim", commit = "15f4c4e523e1fbec74766e1967e1c2491df013c9" },

	-- Conflict markers highlighted
	{ "rhysd/conflict-marker.vim", commit = "62742b2ffe7a433988759c67b5c5a22eff74a14b" },

	-- Vim movements & commands
	-- Surround an object with a character
	{ "tpope/vim-surround", commit = "3d188ed2113431cf8dac77be61b842acb64433d9" },
	-- Define pairs of mappings [<cmd> ]<cmd> that do <cmd> forwards and backwards
	{ "tpope/vim-unimpaired", commit = "6d44a6dc2ec34607c41ec78acf81657248580bf1" },
	-- Repeat vim-unimpaired and vim-surround commands
	{ "tpope/vim-repeat", commit = "65846025c15494983dafe5e3b46c8f88ab2e9635" },
	-- Case preserving substitution and more
	{ "tpope/vim-abolish", commit = "dcbfe065297d31823561ba787f51056c147aa682" },
	-- use <EasyMotion-prefix> <motion> to highlight possible motions (jk, web, ...)
	{ "easymotion/vim-easymotion", commit = "b3cfab2a6302b3b39f53d9fd2cd997e1127d7878" },
	-- motions like f, t using 2 characters
	{ "justinmk/vim-sneak", commit = "c13d0497139b8796ff9c44ddb9bc0dc9770ad2dd" },
	-- highlight posible f, t motions
	{ "unblevable/quick-scope", commit = "4d35d3b2bc6794666353dcc241b2680bd560416f" },
	-- Movements inside () [] {} , and more
	{ "wellle/targets.vim", commit = "6325416da8f89992b005db3e4517aaef0242602e" },
	-- Work with arguments also
	{ "PeterRincker/vim-argumentative", commit = "63a5f7deb675c38126de626f4c00e000902462fe" },
	-- https://github.com/AndrewRadev/sideways.vim Also good
	{
		"kana/vim-textobj-entire",
		commit = "64a856c9dff3425ed8a863b9ec0a21dbaee6fb3a",

		dependencies = { "kana/vim-textobj-user", commit = "41a675ddbeefd6a93664a4dc52f302fe3086a933" },
	},
	{ "junegunn/vim-easy-align", commit = "9815a55dbcd817784458df7a18acacc6f82b1241" },

	-- syntax highlighting and more for most languages
	{ "sheerun/vim-polyglot", commit = "bc8a81d3592dab86334f27d1d43c080ebf680d42" },

	{ "machakann/vim-highlightedyank", commit = "afb0f262b490706c23e94012c2ab9fa67c0481ce" },
	-- Auto insertion of [], {}, (), "" keeping the cursor in the middle
	{ "windwp/nvim-autopairs", commit = "e38c5d837e755ce186ae51d2c48e1b387c4425c6" },
	-- use CTRL-A/CTRL-X to increment dates, times, and more
	{ "tpope/vim-speeddating", commit = "5a36fd29df63ea3f65562bd2bb837be48a5ec90b" },

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
	{ "michaeljsmith/vim-indent-object", commit = "8ab36d5ec2a3a60468437a95e142ce994df598c6", ft = { "python" } },
	{ "jeetsukumaran/vim-indentwise", commit = "608bd6876d3b56d469e0e615eb774a6e06095dbf", ft = { "python" } },

	{ "tidalcycles/vim-tidal", commit = "e440fe5bdfe07f805e21e6872099685d38e8b761", ft = { "tidal" } },

	{ "PontusHanssen/pddl.vim", commit = "c7ff45feeba1789dd538c1b8dac00ae8ca9239be", ft = { "lisp", "pddl" } },
	{
		"gpanders/nvim-parinfer",
		commit = "5ca09287ab3f4144f78ff7977fabc27466f71044",

		ft = { "lisp", "fennel", "clojure", "racket", "pddl" },
	},

	-- neovim in the browser
	{
		"glacambre/firenvim",
		commit = "c6e37476ab3b58cf01ababfe80ec9335798e70e5",
		lazy = not vim.g.started_by_firenvim,

		build = function()
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
	{ "ThePrimeagen/vim-be-good", commit = "4fa57b7957715c91326fcead58c1fa898b9b3625" },
})
