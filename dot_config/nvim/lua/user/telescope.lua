local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local lga_actions = require("telescope-live-grep-args.actions")
local project_actions = require("telescope._extensions.project.actions")

telescope.setup({
	defaults = {

		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = {
			"%.npz",
			"%.pyc",
			"%.luac",
			"%.ipynb",
			"vendor/*",
			"%.lock",
			"__pycache__/*",
			"%.sqlite3",
			"%.ipynb",
			"node_modules/*",
			"%.min.js",
			"%.jpg",
			"%.jpeg",
			"%.png",
			"%.svg",
			"%.otf",
			"%.ttf",
			".git/",
			"%.webp",
			".dart_tool/",
			".github/",
			".gradle/",
			".idea/",
			".settings/",
			".vscode/",
			"__pycache__/",
			"build/",
			"env/",
			"gradle/",
			"node_modules/",
			"target/",
			"%.pdb",
			"%.dll",
			"%.class",
			"%.exe",
			"%.so",
			"%.cache",
			"%.ico",
			"%.pdf",
			"%.dylib",
			"%.jar",
			"%.docx",
			"%.met",
			"smalljre_*/*",
			".vale/",
		},
		preview = { treesitter = false },

		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-a>"] = lga_actions.tokenize(),

				["<C-c>"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["<Left>"] = actions.add_selection,
				["<Right>"] = actions.remove_selection,

				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-h>"] = actions.which_key,
			},

			n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["l"] = actions.add_selection,
				["h"] = actions.remove_selection,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["<Left>"] = actions.add_selection,
				["<Right>"] = actions.remove_selection,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
		project = {
			search_by = { "path", "title" },
			hidden_files = true, -- default: false
			sync_with_nvim_tree = true, -- default false
			on_project_selected = function(prompt_bufnr)
				project_actions.change_working_directory(prompt_bufnr, false)
				vim.cmd("Telescope frecency workspace=CWD")
			end,
		},
		frecency = {
			auto_validate = true,
			matcher = "fuzzy",
			db_validate_threshold = 1,
			show_scores = false,
		},

		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	},
})

telescope.load_extension("project")
telescope.load_extension("fzf")
telescope.load_extension("refactoring")
telescope.load_extension("bookmarks")
telescope.load_extension("frecency")

function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg("v")
	vim.fn.setreg("v", {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ""
	end
end

local keymap = vim.keymap.set
local tb = require("telescope.builtin")
local opts = { noremap = true, silent = true }

keymap("n", "<space>ss", ":Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("v", "<space>ss", function()
	local text = vim.getVisualSelection()
	tb.current_buffer_fuzzy_find({ default_text = text })
end, opts)

vim.keymap.set("v", "<space>F", function()
	local text = vim.getVisualSelection()
	require("telescope.builtin").live_grep({ default_text = text })
end, { noremap = true, silent = true })
