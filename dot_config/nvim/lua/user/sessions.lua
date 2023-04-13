local status_ok, persisted = pcall(require, "persisted")
if not status_ok then
	return
end
persisted.setup()

local status_ok, bookmarks = pcall(require, "bookmarks")
if not status_ok then
	return
end
bookmarks.setup({
	keymap = {
		toggle = "<space>bl",
		jump = "<CR>", -- Jump from bookmarks
		order = "<space><space>", -- Order bookmarks by frequency or updated_time
		delete_on_virt = "\\dd", -- Delete bookmark at virt text line
		show_desc = "\\sd", -- show bookmark desc
	},
	width = 0.8, -- Bookmarks window width:  (0, 1]
	height = 0.6, -- Bookmarks window height: (0, 1]
	preview_ratio = 0.4, -- Bookmarks preview window ratio (0, 1]
	preview_ext_enable = false, -- If true, preview buf will add file ext, preview window may be highlighed(treesitter), but may be slower.
	fix_enable = false, -- If true, when saving the current file, if the bookmark line number of the current file changes, try to fix it.
	hl_cursorline = "guibg=Gray guifg=White", -- hl bookmarsk window cursorline.

	virt_text = "🔖", -- Show virt text at the end of bookmarked lines
	virt_pattern = { "*.js", "*.html", "*.css", "*.py", "*.go", "*.lua", "*.vim", "*.sh", "*.php", "*.rs" }, -- Show virt text only on matched pattern
})
