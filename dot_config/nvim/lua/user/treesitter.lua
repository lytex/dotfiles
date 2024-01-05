local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "org" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	indent = { enable = true, disable = { "yaml" } },
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
})

local status_ok, parser_config = pcall(require, "nvim-treesitter.parsers")
if not status_ok then
	return
end

parser_config.org = {
	install_info = {
		url = "https://github.com/milisims/tree-sitter-org",
		revision = "f110024d539e676f25b72b7c80b0fd43c34264ef",
		files = { "src/parser.c", "src/scanner.cc" },
	},
	filetype = "org",
}

local status_ok, ts_context_commentstring = pcall(require, "ts_context_commentstring")
if not status_ok then
	return
end
ts_context_commentstring.setup({
	enable_autocmd = false,
})

local status_ok, refactoring = pcall(require, "refactoring")
if not status_ok then
	return
end
refactoring.setup({})
