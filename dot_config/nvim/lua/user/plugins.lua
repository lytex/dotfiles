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
	{ "nvim-lua/plenary.nvim", commit = "74b06c6c75e4eeb3108ec01852001636d85a932b",  }, -- Useful lua functions used ny lots of plugins
	{ "windwp/nvim-autopairs", commit = "7b9923abad60b903ece7c52940e1321d39eccc79",  }, -- Autopairs, integrates with both cmp and treesitter
	{ "numToStr/Comment.nvim", commit = "e30b7f2008e52442154b66f7c519bfd2f1e32acb",  }, -- Easily comment stuff
	{
		"nvim-neo-tree/neo-tree.nvim", commit = "722a182f6608172bdc3fd295b6180e583316ef1d",
		

		dependencies = {
			{ "nvim-lua/plenary.nvim", commit = "74b06c6c75e4eeb3108ec01852001636d85a932b",  },
			{ "nvim-tree/nvim-web-devicons", commit = "0d7d35fa946837b8738b17c18d1faa1ac351e7f9",  }, -- not strictly required, but recommended
			{ "MunifTanjim/nui.nvim", commit = "de740991c12411b663994b2860f1a4fd0937c130",  },
			{
				"s1n7ax/nvim-window-picker", commit = "6382540b2ae5de6c793d4aa2e3fe6dbb518505ec",
				

				version = "2.*",
			},
		},
	},
	{ "akinsho/bufferline.nvim", commit = "655133c3b4c3e5e05ec549b9f8cc2894ac6f51b3",  },
	{ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56",  },
	{ "nvim-lualine/lualine.nvim", commit = "131a558e13f9f28b15cd235557150ccb23f89286",  },
	{ "akinsho/toggleterm.nvim", commit = "9a88eae817ef395952e08650b3283726786fb5fb",  },
	{ "lukas-reineke/indent-blankline.nvim", commit = "d28a3f70721c79e3c5f6693057ae929f3d9c0a03",  main = "ibl" },
	{ "goolord/alpha-nvim", commit = "6c6a89d5b068b5251c8bdf0dd57bb921bcfeeb09",  },
	{ "folke/which-key.nvim", commit = "3aab2147e74890957785941f0c1ad87d0a44c15a",  },
	{ "mbbill/undotree", commit = "6fa6b57cda8459e1e4b2ca34df702f55242f4e4d",  },
	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	{ "shaunsingh/solarized.nvim", commit = "fe02ed49cc017cc93657bd6306a2624394611c69",  },
	{ "patstockwell/vim-monokai-tasty", commit = "0b82de318a2dd905f8eb1b12fcef785eb0953ef3",  },
	{ "norcalli/nvim-colorizer.lua", commit = "a065833f35a3a7cc3ef137ac88b5381da2ba302e",  },
	{ "vim-scripts/AnsiEsc.vim", commit = "d2bb7878622e4c16203acf1c92a0f4bc7ac58003",  },

	-- cmp plugins
	{ "hrsh7th/nvim-cmp", commit = "a1d504892f2bc56c2e79b65c6faded2fd21f3eca",  }, -- The completion plugin
	{ "hrsh7th/cmp-buffer", commit = "b74fab3656eea9de20a9b8116afa3cfc4ec09657",  }, -- buffer completions
	{ "hrsh7th/cmp-path", commit = "c642487086dbd9a93160e1679a1327be111cbc25",  }, -- path completions
	{ "hrsh7th/cmp-cmdline", commit = "d126061b624e0af6c3a556428712dd4d4194ec6d",  }, -- cmdline completions
	{ "saadparwaiz1/cmp_luasnip", commit = "98d9cb5c2c38532bd9bdb481067b20fea8f32e90",  }, -- snippet completions
	{ "hrsh7th/cmp-nvim-lsp", commit = "cbc7b02bb99fae35cb42f514762b89b5126651ef",  },

	-- snippets
	{ "L3MON4D3/LuaSnip", commit = "0abc8f390b278c3b4aabc4c004ac8a088b65cf24",  }, --snippet engine
	{ "rafamadriz/friendly-snippets", commit = "6cd7280adead7f586db6fccbd15d2cac7e2188b9",  }, -- a bunch of snippets to use

	-- LSP

	{ "neovim/nvim-lspconfig", commit = "a4ed4e761c400849e8c9f8bda33e5083f890268c",  }, -- enable LSP
	{ "williamboman/mason.nvim", commit = "bb639d4bf385a4d89f478b83af4d770be05ab7eb",  },
	{ "williamboman/mason-lspconfig.nvim", commit = "7b01e2974a47d489bb92f47a41e4c0088ea8f86e",  },
	{
		"nvimtools/none-ls.nvim", commit = "f9d557ac7cd28a3a993b5ea49716498bd540b01f",
		

		dependencies = {
			"nvimtools/none-ls-extras.nvim", commit = "167f29529ff1438e673b1792a71aaf79ddd6c74f",
			
		},
	}, -- for formatters and linters
	{
		"RRethy/vim-illuminate", commit = "0d1e93684da00ab7c057410fecfc24f434698898",
		
	},
	{
		"kevinhwang91/nvim-ufo", commit = "ab3eb124062422d276fae49e0dd63b3ad1062cfc",
		

		dependencies = { "kevinhwang91/promise-async", commit = "119e8961014c9bfaf1487bf3c2a393d254f337e2",  },
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
	-- 		{ "nvim-lua/plenary.nvim", commit = "74b06c6c75e4eeb3108ec01852001636d85a932b",  branch = "master" }, -- for curl, log and async functions
	-- 	},
	-- 	build = "make tiktoken", -- Only on MacOS or Linux
	-- 	opts = {
	-- 		-- See Configuration section for options
	-- 	},
	-- 	-- See Commands section for default commands if you want to lazy load on them
	-- },

	-- Telescope
	{ "nvim-telescope/telescope.nvim", commit = "7d324792b7943e4aa16ad007212e6acc6f9fe335",  },
	{ "nvim-telescope/telescope-file-browser.nvim", commit = "3610dc7dc91f06aa98b11dca5cc30dfa98626b7e",  },

	{
		"nvim-telescope/telescope-frecency.nvim", commit = "5479d8a269e30479280c59e44f805396127653e6",
		
	},
	{ "lytex/telescope-live-grep-args.nvim", commit = "2f8dd161ed138cac596b948d187f8823799cc5c4",  },
	{
		"nvim-telescope/telescope-fzf-native.nvim", commit = "b25b749b9db64d375d782094e2b9dce53ad53a40",
		

		build = "make",
	},

	-- Projects
	{ "lytex/telescope-project.nvim", commit = "9237849feb8206b82d1d0b88c9eda4d11b5ffe03",  },
	{ "olimorris/persisted.nvim", commit = "1a8e9dcf277d61105619498b2002c287c50424b8",  }, -- Persistence of folds and cursor position
	{ "crusj/bookmarks.nvim", commit = "e719191ba3ec67d45993a6aed2a7abd7f9fd2459",  }, -- Per project bookmarks
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
		"jenterkin/vim-autosource", commit = "2e70847389f2ed66c8d0852100c220bbf5951b45",
		

		config = function()
			vim.g.autosource_hashdir = os.getenv("HOME") .. "/.cache/vim-autosource/hashes"
		end,
	},
	{
		"bloznelis/before.nvim", commit = "187bafe2792a82d53cdb632971e4113cd703ac53",
		

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
		"nvim-treesitter/nvim-treesitter", commit = "4916d6592ede8c07973490d9322f187e07dfefac",
		

		lazy = false,
		opts = {
			highlight = { enable = true },
		},
		build = ":TSUpdate",
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring", commit = "6141a40173c6efa98242dc951ed4b6f892c97027",  },
	{
		"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
	},
	{
		"ThePrimeagen/refactoring.nvim", commit = "8f2045241fb105ab092021e3e58b5b99f34f07d0",
		

		dependencies = {
			{ "nvim-lua/plenary.nvim", commit = "74b06c6c75e4eeb3108ec01852001636d85a932b",  },
			{ "nvim-treesitter/nvim-treesitter", commit = "4916d6592ede8c07973490d9322f187e07dfefac",  },
		},
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects", commit = "851e865342e5a4cb1ae23d31caf6e991e1c99f1e",  },

	-- Git
	{
		"lewis6991/gitsigns.nvim", commit = "dd3f588bacbeb041be6facf1742e42097f62165d",
		
		
	},
	{ "tpope/vim-fugitive", commit = "3b753cf8c6a4dcde6edee8827d464ba9b8c4a6f0",  },
	-- Branches of a feather, flog together
	{ "rbong/vim-flog", commit = "665b16ac8915f746bc43c9572b4581a5e9047216",  },
	-- {
	-- 	"SuperBo/fugit2.nvim",
	-- 	
	-- 	opts = {
	-- 		width = 100,
	-- 	},
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim", commit = "de740991c12411b663994b2860f1a4fd0937c130",
	-- 		
	-- 		"nvim-tree/nvim-web-devicons", commit = "0d7d35fa946837b8738b17c18d1faa1ac351e7f9",
	-- 		
	-- 		"echasnovski/mini.icons",
	-- 		
	-- 		"nvim-lua/plenary.nvim", commit = "74b06c6c75e4eeb3108ec01852001636d85a932b",
	-- 		
	-- 		{
	-- 			"chrisgrieser/nvim-tinygit",
	-- 			 -- optional: for Github PR view
	-- 			dependencies = { "stevearc/dressing.nvim",  },
	-- 		},
	-- 	},
	-- 	cmd = { "Fugit2", "Fugit2Diff", "Fugit2Graph" },
	-- 	keys = {
	-- 		{ "<leader>F", mode = "n", "<cmd>Fugit2<cr>" },
	-- 	},
	-- },

	-- DAP
	--[[ { "mfussenegger/nvim-dap" }, ]]
	--[[ { "rcarriga/nvim-dap-ui" }, ]]
	--[[ { "ravenxrz/DAPInstall.nvim" }, ]]

	-- Not used for keybindings, only to evaluate lua code
	{ "mrjones2014/legendary.nvim", commit = "6de819bc285eb8c420e49e82c21d5bb696b5a727",  },
	{ "ii14/neorepl.nvim", commit = "15f4c4e523e1fbec74766e1967e1c2491df013c9",  },

	-- Conflict markers highlighted
	{ "rhysd/conflict-marker.vim", commit = "62742b2ffe7a433988759c67b5c5a22eff74a14b",  },

	-- Vim movements & commands
	-- Surround an object with a character
	{ "tpope/vim-surround", commit = "3d188ed2113431cf8dac77be61b842acb64433d9",  },
	-- Define pairs of mappings [<cmd> ]<cmd> that do <cmd> forwards and backwards
	{ "tpope/vim-unimpaired", commit = "db65482581a28e4ccf355be297f1864a4e66985c",  },
	-- Repeat vim-unimpaired and vim-surround commands
	{ "tpope/vim-repeat", commit = "65846025c15494983dafe5e3b46c8f88ab2e9635",  },
	-- Case preserving substitution and more
	{ "tpope/vim-abolish", commit = "dcbfe065297d31823561ba787f51056c147aa682",  },
	-- use <EasyMotion-prefix> <motion> to highlight possible motions (jk, web, ...)
	{ "easymotion/vim-easymotion", commit = "b3cfab2a6302b3b39f53d9fd2cd997e1127d7878",  },
	-- motions like f, t using 2 characters
	{ "justinmk/vim-sneak", commit = "feea86adcfbf8e6b5e71fdd5f4f5736fd8819fdb",  },
	-- highlight posible f, t motions
	{ "unblevable/quick-scope", commit = "6cee1d9e0b9ac0fbffeb538d4a5ba9f5628fabbc",  },
	-- Movements inside () [] {} , and more
	{ "wellle/targets.vim", commit = "6325416da8f89992b005db3e4517aaef0242602e",  },
	-- Work with arguments also
	{ "PeterRincker/vim-argumentative", commit = "63a5f7deb675c38126de626f4c00e000902462fe",  },
	-- https://github.com/AndrewRadev/sideways.vim Also good
	{
		"kana/vim-textobj-entire", commit = "64a856c9dff3425ed8a863b9ec0a21dbaee6fb3a",
		

		dependencies = { "kana/vim-textobj-user", commit = "41a675ddbeefd6a93664a4dc52f302fe3086a933",  },
	},
	{ "junegunn/vim-easy-align", commit = "9815a55dbcd817784458df7a18acacc6f82b1241",  },

	-- syntax highlighting and more for most languages
	{ "sheerun/vim-polyglot", commit = "f061eddb7cdcc614c8406847b2bfb53099832a4e",  },

	{ "machakann/vim-highlightedyank", commit = "285a61425e79742997bbde76a91be6189bc988fb",  },
	-- Auto insertion of [], {}, (), "" keeping the cursor in the middle
	{ "windwp/nvim-autopairs", commit = "7b9923abad60b903ece7c52940e1321d39eccc79",  },
	-- use CTRL-A/CTRL-X to increment dates, times, and more
	{ "tpope/vim-speeddating", commit = "c17eb01ebf5aaf766c53bab1f6592710e5ffb796",  },

	-- Smooth C-u, C-d and more
	{ "psliwka/vim-smoothie", commit = "df1e324e9f3395c630c1c523d0555a01d2eb1b7e",  },

	-- Fancy tabbed terminal emulator to run multiple shell windows and only one neovim instance (neovim-remote)
	{
		"nikvdp/neomux", commit = "e5950a14275062dfe21f489bf84165fd69220e4c",
		

		keys = {
			{ " tr", "<cmd>lua require('lazy').load({plugins = 'neomux'})<cr><cmd>Neomux<cr>", desc = "Neomux" },
			{ "<C-w>t", "lua require('lazy').load({plugins = 'neomux'})<cmd>split<CR><cmd>call NeomuxTerm()<CR>" },
			{ "<C-w>T", "lua require('lazy').load({plugins = 'neomux'})<cmd>vsplit<CR><cmd>call NeomuxTerm()<CR>" },
		},
	},
	-- Better tab management
	{ "gcmt/taboo.vim", commit = "937f67ab9dc2ba1861fabc40ca367e5622c30d36",  },
	-- Interactive terminal
	{ "metakirby5/codi.vim", commit = "83b9859aaf8066d95892e01eb9c01571a4b325dd",  },

	{ "christianrondeau/vim-base64", commit = "d15253105f6a329cd0632bf9dcbf2591fb5944b8",  },

	-- Get statistics about vim usage
	--[[ { "ActivityWatch/aw-watcher-vim",  }, ]]

	-- Movements for python and space indented languages
	{ "jeetsukumaran/vim-pythonsense", commit = "9200a57629c904ed2ab8c9b2e8c5649d311794ba",  ft = { "python" } },
	{ "michaeljsmith/vim-indent-object", commit = "8ab36d5ec2a3a60468437a95e142ce994df598c6",  ft = { "python" } },
	{ "jeetsukumaran/vim-indentwise", commit = "608bd6876d3b56d469e0e615eb774a6e06095dbf",  ft = { "python" } },

	{ "tidalcycles/vim-tidal", commit = "e440fe5bdfe07f805e21e6872099685d38e8b761",  ft = { "tidal" } },

	{ "PontusHanssen/pddl.vim", commit = "c7ff45feeba1789dd538c1b8dac00ae8ca9239be",  ft = { "lisp", "pddl" } },
	{
		"gpanders/nvim-parinfer", commit = "3968e669d9f02589aa311d33cb475b16b27c5fbb",
		

		ft = { "lisp", "fennel", "clojure", "racket", "pddl" },
	},

	-- neovim in the browser
	{
		"glacambre/firenvim", commit = "af775c4a1cef5a1e833ae5c6d81afe229ceb639e",
		

		lazy = not vim.g.started_by_firenvim,

		build = function()
			vim.fn["firenvim#install"](0)
		end,
	},

	-- {
	-- 	"nvim-norgmode/orgmode",
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
	{ "ThePrimeagen/vim-be-good", commit = "0ae3de14eb8efc6effe7704b5e46495e91931cc5",  },
})
