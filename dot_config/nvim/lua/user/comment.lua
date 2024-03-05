local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

comment.setup({
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})

local api = require("Comment.api")
-- Toggle lines (linewise) using C-/
vim.keymap.set("n", "<C-/>", api.toggle.linewise.current)
local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
vim.keymap.set("v", "<C-/>", function()
	vim.api.nvim_feedkeys(esc, "nv", false)
	api.locked("toggle.linewise")(vim.fn.visualmode())
end)
vim.keymap.set("x", "<C-/>", function()
	vim.api.nvim_feedkeys(esc, "nx", false)
	api.locked("toggle.linewise")(vim.fn.visualmode())
	vim.api.nvim_feedkeys("gv", "nx", true)
end)
