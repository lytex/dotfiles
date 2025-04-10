local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local function merge_tables(t1, t2)
	for key, value in pairs(t2) do
		t1[key] = value
	end
	return t1
end

function Find_files_noignore_nohidden()
	require("telescope.builtin").find_files(
		merge_tables(
			require("telescope.themes").get_dropdown({ previewer = false }),
			{ hidden = true, no_ignore = true }
		)
	)
end
function CopilotTelescope()
	local actions = require("CopilotChat.actions")
	require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	--  to enable all native operators, set the preset / operators plugin above
	--	operators = { gc = "Comments" },
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	keys = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	-- window = {
	-- 	border = "rounded", -- none, single, double, shadow
	-- 	position = "bottom", -- bottom, top
	-- 	margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
	-- 	padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
	-- 	winblend = 0,
	-- },
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	-- ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	-- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	notify = false,
	triggers = { { "<auto>", mode = "nxsot" } }, -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	-- triggers_blacklist = {
	-- 	-- list of mode / prefixes that should never be hooked by WhichKey
	-- 	-- this is mostly relevant for key maps that start with a native binding
	-- 	-- most people should not need to change this
	-- 	i = { "j", "k" },
	-- 	v = { "j", "k" },
	-- },
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["a"] = {
		name = "Alpha",
		a = { "<cmd>Alpha<cr>", "Alpha" },
		r = { "<cmd>source $MYVIMRC | source ~/.config/nvim/lua/user/colorscheme.lua<cr>", "Reload" },
	},
	["b"] = {
		name = "buffer/bookmark",
		b = {
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Buffers",
		},
		l = {
			"<cmd>Telescope bookmarks<cr>",
			"List bookmarks",
		},
		m = {
			"<cmd>lua require('bookmarks').add_bookmarks()<cr>",
			"Add bookmark",
		},
		M = {
			"<cmd>lua require('bookmarks').delete()<cr>",
			"Delete bookmark",
		},
	},
	["<CR>"] = {
		"<cmd>lua require('bookmarks').toggle_bookmarks()<cr>",
		"Jump to bookmark",
	},
	["<tab>"] = {
		["n"] = { "<cmd>tabe<cr>", "New tab" },
		["N"] = { "<cmd>:TabooOpen<Space>", "New named tab" },
		[","] = { "<cmd>:TabooRename<Space>", "Rename tab" },
		["."] = { "<cmd>:TabooRename<Space>", "Rename tab" },
		["]"] = { "<cmd>:tabnext<cr>", "Next tab" },
		["["] = { "<cmd>:tabprevious<cr>", "Previous tab" },
	},
	["e"] = { "<cmd>Neotree toggle<cr>", "Explorer" },
	-- ["w"] = { "<cmd>w!<CR>", "Save" },
	-- ["q"] = { "<cmd>q!<CR>", "Quit" },
	["c"] = {
		name = "CodeAction",
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "CodeAction" },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		f = { "<cmd>lua vim.diagnostic.open_float()<CR>", "OpenFloat" },
		["p"] = {
			name = "Copilot  ",
			t = { "<cmd>lua CopilotTelescope()<cr>", "CopilotTelescope" },
		},
	},
	["f"] = {
		[[<cmd>Telescope frecency workspace=CWD<cr>]],
		"Find files",
	},
	["."] = {
		"<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>",
		"Find files",
	},
	["F"] = { "<CMD>lua require('telescope.builtin').live_grep({debounce = 100, theme= 'ivy'})<CR>", "Find Text" },
	["P"] = { "<cmd>lua require('telescope').extensions.project.project{display_type = 'full'}<cr>", "Projects" },

	p = {
		name = "Pkg",
		i = { "<cmd>Lazy install<cr>", "install" },
		u = { "<cmd>Lazy update<cr>", "update" },
		s = { "<cmd>Lazy sync<cr>", "sync" },
		x = { "<cmd>Lazy clean<cr>", "clean" },
		c = { "<cmd>Lazy check<cr>", "check" },
		l = { "<cmd>Lazy log<cr>", "log" },
		r = { "<cmd>Lazy restore<cr>", "restore" },
		p = { "<cmd>Lazy profile<cr>", "profile" },
		b = { "<cmd>Lazy build<cr>", "build" },
		h = { "<cmd>Lazy home<cr>", "home" },
		H = { "<cmd>checkhealth lazy<cr>", "health" },
	},

	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		S = { "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
		-- Send file to upper buffer,
		-- Assumes there is a even horizontal split
		f = { "<cmd>norm<C-w>rmRgF<C-w>j`R<cr>", "go file buff up" },
		-- conflict
		h = {
			name = "Git conflict",
			t = { "<cmd>ConflictMarkerThemselves<cr>", ">>> pick theirs" },
			[">"] = { "<cmd>ConflictMarkerThemselves<cr>", ">>> pick theirs" },
			o = { "<cmd>ConflictMarkerOurselves<cr>", "<<< pick ours" },
			["<"] = { "<cmd>ConflictMarkerOurselves<cr>", "<<< pick ours" },
			n = { "<cmd>ConflictMarkerNone<cr>", "🙅 pick none" },
			b = { "<cmd>ConflictMarkerBoth<cr>", "🤷 pick both" },
			["="] = { "<cmd>ConflictMarkerBoth<cr>", "🤷 pick both" },
			B = { "<cmd>ConflictMarkerBoth!<cr>", "!🤷 pick both (inverted)" },
			["+"] = { "<cmd>ConflictMarkerBoth!<cr>", "🤷 pick both" },
			j = { "<cmd>ConflictMarkerNextHunk<cr>", "🙅 pick none" },
			k = { "<cmd>ConflictMarkerPrevHunk<cr>", "🙅 pick none" },
		},
	},
	h = {
		name = "Help",
		c = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "telescope help tags" },
	},
	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		c = { "<cmd>lua CloseAllFloatingWindows()<cr>", "Close Floating Wins" },
		d = {
			"<cmd>Telescope lsp_document_diagnostics<cr>",
			"Document Diagnostics",
		},
		w = {
			"<cmd>Telescope lsp_workspace_diagnostics<cr>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = {
			"<cmd>lua vim.diagnostic.goto_next()<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.diagnostic.goto_prev()<cr>",
			"Prev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		q = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Quickfix" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},
	["q"] = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Quickfix" },
	d = {
		name = "debugger",
		b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle breakpoint" },
		c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
		i = { "<cmd>lua require('dap').step_into()<cr>", "Step into" },
		o = { "<cmd>lua require('dap').step_over()<cr>", "Step over" },
		O = { "<cmd>lua require('dap').step_out()<cr>", "Step out" },
		r = { "<cmd>lua require('dap').repl.toggle()<cr>", "REPL toggle" },
		l = { "<cmd>lua require('dap').run_last()<cr>", "Run last" },
		u = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI" },
		t = { "<cmd>lua require('dap').terminate()<cr>", "Terminate" },
	},
	s = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		m = { "<cmd>Telescope marks<cr>", "marks" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
		q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
		Q = { "<cmd>Telescope quickfixhistory<cr>", "Quickfix Hist" },
	},

	t = {
		name = "Toggle",
		t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		f = { "<cmd>call ToggleFormatOnSave()<cr>", "Toggle Format on Save" },
		r = { "<cmd>lua require('lazy').load({plugins = 'neomux'})<cr><cmd>Neomux<cr>", "Neomux" },
		p = { "<cmd>InspectTree<cr>", "Toggle insPect Tree" },
		q = { "<cmd>EditQuery<cr>", "Toggle Query editor" },
		l = { "<cmd>lua ToggleRelativeNumber(); vim.cmd('QuickScopeToggle')<cr>", "Toggle RelNumber" },
		v = { "<cmd>lua vim.diagnostic.config({ virtual_text = true })<cr>", "Enable VirtualText" },
		b = { "<cmd>lua vim.diagnostic.config({ virtual_text = false })<cr>", "Disable VirtualText" },
		u = { "<cmd>UndotreeToggle<cr>", "Toggle Undotree" },
	},

	o = {
		name = "text operations",
		-- q = { "<cmd>lua require('before').show_edits_in_quickfix<cr>", "qflist prev edits" },
		-- e = { "<cmd>lua require('before').show_edits_in_telescope<cr>", "telescope prev edits" },
		u = { "<cmd>UndotreeToggle<cr>", "Undotree" },
	},

	v = {
		name = "Evaluate",
		o = { "<cmd>LegendaryScratch<cr>", "Open" },
		v = { "<cmd>LegendaryEvalBuf<cr>", "Everything" },
		l = { "<cmd>LegendaryEvalLine<cr>", "Line" },
	},
	x = { "<cmd>call Scratch()<cr>", "Scratch" },
}

local visual_opts = { mode = "v", prefix = "<leader>", noremap = true, silent = true, expr = false }

local visual_mappings = {
	b = {
		d = { "h<Esc><Cmd>call base64#v_atob()<cr>", "Base64 Decode" },
		e = { "h<Esc><Cmd>call base64#v_btoa()<cr>", "Base64 Encode" },
	},
	r = {
		e = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Function" },
		f = {
			"<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
			"Extract Function To File",
		},
		v = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable" },
		i = { "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
		r = { "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "w/ Telescope" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(visual_mappings, visual_opts)
