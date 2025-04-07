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
	{ "nvim-lua/plenary.nvim", commit = "857c5ac632080dba10aae49dba902ce3abf91b35" }, -- Useful lua functions used ny lots of plugins
	{ "windwp/nvim-autopairs", commit = "2a406cdd8c373ae7fe378a9e062a5424472bd8d8" }, -- Autopairs, integrates with both cmp and treesitter
	{ "numToStr/Comment.nvim", commit = "e30b7f2008e52442154b66f7c519bfd2f1e32acb" }, -- Easily comment stuff
	{
		"nvim-neo-tree/neo-tree.nvim",
		commit = "73d63376352ac731379892e27ac7b3d9449148e3",

		dependencies = {
			{ "nvim-lua/plenary.nvim", commit = "857c5ac632080dba10aae49dba902ce3abf91b35" },
			{ "nvim-tree/nvim-web-devicons", commit = "57dfa947cc88cdf1baa2c7e13ed31edddd8fb1d1" }, -- not strictly required, but recommended
			{ "MunifTanjim/nui.nvim", commit = "8d3bce9764e627b62b07424e0df77f680d47ffdb" },
			{
				"s1n7ax/nvim-window-picker",
				commit = "6382540b2ae5de6c793d4aa2e3fe6dbb518505ec",

				version = "2.*",
			},
		},
	},
	{ "akinsho/bufferline.nvim", commit = "655133c3b4c3e5e05ec549b9f8cc2894ac6f51b3" },
	{ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" },
	{ "nvim-lualine/lualine.nvim", commit = "834a5817f7e2be22a7062620032d49c600c35fab" },
	{ "akinsho/toggleterm.nvim", commit = "9a88eae817ef395952e08650b3283726786fb5fb" },
	{ "lukas-reineke/indent-blankline.nvim", commit = "005b56001b2cb30bfa61b7986bc50657816ba4ba", main = "ibl" },
	{ "goolord/alpha-nvim", commit = "de72250e054e5e691b9736ee30db72c65d560771" },
	{ "folke/which-key.nvim", commit = "370ec46f710e058c9c1646273e6b225acf47cbed" },
	{ "mbbill/undotree", commit = "b951b87b46c34356d44aa71886aecf9dd7f5788a" },
	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	{ "shaunsingh/solarized.nvim", commit = "fe02ed49cc017cc93657bd6306a2624394611c69" },
	{ "patstockwell/vim-monokai-tasty", commit = "36843b3c03eb6965eb5e3ed706f357b5c73ce8d4" },
	{ "norcalli/nvim-colorizer.lua", commit = "a065833f35a3a7cc3ef137ac88b5381da2ba302e" },
	{ "vim-scripts/AnsiEsc.vim", commit = "d2bb7878622e4c16203acf1c92a0f4bc7ac58003" },

	-- cmp plugins
	{ "hrsh7th/nvim-cmp", commit = "059e89495b3ec09395262f16b1ad441a38081d04" }, -- The completion plugin
	{ "hrsh7th/cmp-buffer", commit = "b74fab3656eea9de20a9b8116afa3cfc4ec09657" }, -- buffer completions
	{ "hrsh7th/cmp-path", commit = "c6635aae33a50d6010bf1aa756ac2398a2d54c32" }, -- path completions
	{ "hrsh7th/cmp-cmdline", commit = "d250c63aa13ead745e3a40f61fdd3470efde3923" }, -- cmdline completions
	{ "saadparwaiz1/cmp_luasnip", commit = "98d9cb5c2c38532bd9bdb481067b20fea8f32e90" }, -- snippet completions
	{ "hrsh7th/cmp-nvim-lsp", commit = "a8912b88ce488f411177fc8aed358b04dc246d7b" },

	-- snippets
	{ "L3MON4D3/LuaSnip", commit = "c9b9a22904c97d0eb69ccb9bab76037838326817" }, --snippet engine
	{ "rafamadriz/friendly-snippets", commit = "efff286dd74c22f731cdec26a70b46e5b203c619" }, -- a bunch of snippets to use

	-- LSP

	{ "neovim/nvim-lspconfig", commit = "d3ad666b7895f958d088cceb6f6c199672c404fe" }, -- enable LSP
	{ "williamboman/mason.nvim", commit = "fc98833b6da5de5a9c5b1446ac541577059555be" },
	{ "williamboman/mason-lspconfig.nvim", commit = "1a31f824b9cd5bc6f342fc29e9a53b60d74af245" },
	{
		"nvimtools/none-ls.nvim",
		commit = "6377e77dae38015d0a8c24852530098f1d8a24f6",

		dependencies = {
			"nvimtools/none-ls-extras.nvim",
			commit = "1214d729e3408470a7b7a428415a395e5389c13c",
		},
	}, -- for formatters and linters
	{
		"RRethy/vim-illuminate",
		commit = "19cb21f513fc2b02f0c66be70107741e837516a1",
	},
	{
		"kevinhwang91/nvim-ufo",
		commit = "61463090a4f55f5d080236ea62f09d1cd8976ff3",

		dependencies = { "kevinhwang91/promise-async", commit = "119e8961014c9bfaf1487bf3c2a393d254f337e2" },
	},

	-- Copilot
	-- { "github/copilot.vim",  },
	-- {
	-- 	"zbirenbaum/copilot.lua",
	--
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- },
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	--
	-- 	config = function()
	-- 		require("copilot_cmp").setup({
	-- 			filetypes = {
	-- 				terraform = false,
	-- 				yaml = false,
	-- 				sh = function()
	-- 					if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
	-- 						-- disable for .env files
	-- 						return false
	-- 					end
	-- 					return true
	-- 				end,
	-- 			},
	-- 		})
	-- 	end,
	-- },
	--
	-- {
	-- 	"CopilotC-Nvim/CopilotChat.nvim",
	--
	-- 	dependencies = {
	-- 		{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
	-- 		{ "nvim-lua/plenary.nvim", commit = "857c5ac632080dba10aae49dba902ce3abf91b35", branch = "master" }, -- for curl, log and async functions
	-- 	},
	-- 	build = "make tiktoken", -- Only on MacOS or Linux
	-- 	opts = {
	-- 		-- See Configuration section for options
	-- 	},
	-- 	-- See Commands section for default commands if you want to lazy load on them
	-- },

	-- Telescope
	{ "nvim-telescope/telescope.nvim", commit = "a4ed82509cecc56df1c7138920a1aeaf246c0ac5" },
	{ "nvim-telescope/telescope-file-browser.nvim", commit = "626998e5c1b71c130d8bc6cf7abb6709b98287bb" },

	{
		"nvim-telescope/telescope-frecency.nvim",
		commit = "aa28501258a66b7182a3071064c2d214ca840fbd",
	},
	{ "lytex/telescope-live-grep-args.nvim", commit = "2f8dd161ed138cac596b948d187f8823799cc5c4" },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		commit = "1f08ed60cafc8f6168b72b80be2b2ea149813e55",

		build = "make",
	},

	-- Projects
	{ "lytex/telescope-project.nvim", commit = "9237849feb8206b82d1d0b88c9eda4d11b5ffe03" },
	{ "olimorris/persisted.nvim", commit = "d35a3ed973e17defd8800acd46a0c893498a2671" }, -- Persistence of folds and cursor position
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
		commit = "187bafe2792a82d53cdb632971e4113cd703ac53",

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
		commit = "205faba1768a6e4c854f156bc6a21a41b242599c",

		lazy = false,
		opts = {
			highlight = { enable = true },
		},
		build = ":TSUpdate",
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring", commit = "1b212c2eee76d787bbea6aa5e92a2b534e7b4f8f" },
	{
		"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
	},
	{
		"ThePrimeagen/refactoring.nvim",
		commit = "b00a68cebad6baa5eb5fb058b4ecf6e660b67c3d",

		dependencies = {
			{ "nvim-lua/plenary.nvim", commit = "857c5ac632080dba10aae49dba902ce3abf91b35" },
			{ "nvim-treesitter/nvim-treesitter", commit = "205faba1768a6e4c854f156bc6a21a41b242599c" },
		},
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects", commit = "698b5f805722254bca3c509591c1806d268b6c2f" },

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		commit = "17ab794b6fce6fce768430ebc925347e349e1d60",
		commit = "3e6e91b09f0468c32d3b96dcacf4b947f037ce25",
	},
	{ "tpope/vim-fugitive", commit = "4a745ea72fa93bb15dd077109afbb3d1809383f2" },
	-- Branches of a feather, flog together
	{ "rbong/vim-flog", commit = "665b16ac8915f746bc43c9572b4581a5e9047216" },
	{
		"SuperBo/fugit2.nvim",
		commit = "ae9f013369306aa2263e8bb4db604896f0fbfc5f",
		opts = {
			width = 100,
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			commit = "8d3bce9764e627b62b07424e0df77f680d47ffdb",
			"nvim-tree/nvim-web-devicons",
			commit = "57dfa947cc88cdf1baa2c7e13ed31edddd8fb1d1",
			"echasnovski/mini.icons",
			commit = "397ed3807e96b59709ef3292f0a3e253d5c1dc0a",
			"nvim-lua/plenary.nvim",
			commit = "857c5ac632080dba10aae49dba902ce3abf91b35",
			{
				"chrisgrieser/nvim-tinygit",
				commit = "b78889776520c3f10b2a1b9adc06f903f4098cd8", -- optional: for Github PR view
				dependencies = { "stevearc/dressing.nvim", commit = "2d7c2db2507fa3c4956142ee607431ddb2828639" },
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
	{ "mrjones2014/legendary.nvim", commit = "6de819bc285eb8c420e49e82c21d5bb696b5a727" },
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
	{ "justinmk/vim-sneak", commit = "18b1faf020e6a66c1ce09b3ff5e6b6feb182973b" },
	-- highlight posible f, t motions
	{ "unblevable/quick-scope", commit = "f2b6043e04d9ef05205c8953e389304a4c1946f2" },
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
	{ "sheerun/vim-polyglot", commit = "f5393cfee07aeb666f4d75f9b3a83163862fb094" },

	{ "machakann/vim-highlightedyank", commit = "285a61425e79742997bbde76a91be6189bc988fb" },
	-- Auto insertion of [], {}, (), "" keeping the cursor in the middle
	{ "windwp/nvim-autopairs", commit = "2a406cdd8c373ae7fe378a9e062a5424472bd8d8" },
	-- use CTRL-A/CTRL-X to increment dates, times, and more
	{ "tpope/vim-speeddating", commit = "c17eb01ebf5aaf766c53bab1f6592710e5ffb796" },

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
	{ "gcmt/taboo.vim", commit = "937f67ab9dc2ba1861fabc40ca367e5622c30d36" },
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
		commit = "c4ab7d2aeb145cd93db8660cb134f771722f2b5e",

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
	{ "ThePrimeagen/vim-be-good", commit = "0ae3de14eb8efc6effe7704b5e46495e91931cc5" },
})
