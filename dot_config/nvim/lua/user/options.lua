local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = false, -- Issue with python not reacting to >> command
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	-- termguicolors = true,                    -- set term gui colors (most terminals support this)
	timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = false, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes:2", -- always show the sign column, otherwise it would shift the text each time. 2 for LSP and gitsigns
	wrap = false, -- display lines as one long line
	scrolloff = 8, -- is one of my fav
	sidescrolloff = 8,
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
	virtualedit = "onemore",
	-- guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set isfname+=32]]) -- Allow filenames with spaces
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work

vim.cmd([[let g:AutoPairsMapBS = 0]])
vim.cmd([[let g:AutoPairsMapCh = 0]])

-- VSCode like conflict markers
vim.cmd([[
	" disable the default highlight group
	let g:conflict_marker_highlight_group = ''

	" Include text after begin and end markers
	let g:conflict_marker_begin = '^<<<<<<< .*$'
	let g:conflict_marker_end   = '^>>>>>>> .*$'

	highlight ConflictMarkerBegin guibg=#2f7366
	highlight ConflictMarkerOurs guibg=#2e5049
	highlight ConflictMarkerTheirs guibg=#344f69
	highlight ConflictMarkerEnd guibg=#2f628e
	highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81
]])

if vim.fn.system("cat ~/.config/plasmarc | grep dark || true") == "" then
	vim.g.neovide_theme = "light"
else
	vim.g.neovide_theme = "dark"
end
