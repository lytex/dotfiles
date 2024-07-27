local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local none_ls_status_ok, none_ls = pcall(require, "none-ls")
if not none_ls_status_ok then
	return
end

-- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier,
		formatting.black.with({ extra_args = { "--fast", "--line-length", "120" } }),
		formatting.isort,
		formatting.stylua,
		formatting.gofmt,
		none_ls.diagnostics.flake8,
		none_ls.diagnostics.bashls,
	},
})
