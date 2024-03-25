local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
	return
end

vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree" }
vim.api.nvim_set_keymap("n", "<a-n>", '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<a-p>",
	'<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>',
	{ noremap = true }
)

illuminate.configure({
	providers = {
		"lsp",
		"treesitter",
		"regex",
	},
	delay = 200,
	filetypes_denylist = {
		"",
		"dirvish",
		"fugitive",
		"alpha",
		"NvimTree",
		"neo-tree",
		"packer",
		"neogitstatus",
		"Trouble",
		"lir",
		"lazy",
		"Outline",
		"spectre_panel",
		"toggleterm",
		"DressingSelect",
		"TelescopePrompt",
		"qf",
		"org",
		"markdown",
		"floggraph",
		"lspinfo",
	},
	filetypes_allowlist = {},
	modes_denylist = {},
	modes_allowlist = {},
	providers_regex_syntax_denylist = {},
	providers_regex_syntax_allowlist = {},
	-- large_file_cutoff: number of lines at which to use large_file_config
	-- The `under_cursor` option is disabled when this cutoff is hit
	large_file_cutoff = 1000,
	-- large_file_config: config to use for large files (based on large_file_cutoff).
	-- Supports the same keys passed to .configure
	-- If nil, vim-illuminate will be disabled for large files.
	large_file_overrides = nil,
	under_cursor = true,
})
