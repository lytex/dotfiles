local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
-- Ctrl+Backspace deletes word
vim.keymap.set("i", "<C-BS>", "<C-w>")
vim.keymap.set("i", "<C-H>", "<C-w>")
vim.keymap.set("i", "<C-Del>", "<C-o>dw")
-- keymap("i", "<C-BS>", "<C-w>", opts) --This one is not working, no idea why

-- QuickFixList Remappings
keymap("n", "<C-j>", "<cmd>cnext<cr>", opts)
keymap("n", "<C-k>", "<cmd>cprev<cr>", opts)
keymap("n", "<C-q>", "<cmd>copen<cr>", opts)
keymap("n", "<leader>j", "<cmd>lnext<cr>", opts)
keymap("n", "<leader>k", "<cmd>lprev<cr>", opts)
keymap("n", "<leader>q", "<cmd>lopen<cr>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Reload with F5
keymap("", "<f5>", "<cmd>e! %<cr>", opts)

-- Terminal --

-- Delete buffer and close window on C-d
keymap("t", "<C-d>", [[<C-d><C-\><C-n><cmd>:Bd!<cr><cmd>quit<cr>]], opts)

function _OPEN_TERMINAL_NVIM()
	local nvim_tmux_session = assert(io.open("/tmp/nvim_tmux_session", "r"))
	local tmux_session = nvim_tmux_session:read("*all")
	nvim_tmux_session:close()
	-- Always open a new instance of alacritty, to avoid shared sessions
	local cmd = [[(setsid sh -c 'export $(cat /tmp/nvim_env); /usr/bin/alacritty -e zsh' &)]]
	os.execute(cmd)
	os.execute("sleep 5")
	os.execute([[(setsid sh -c 'cd ~ && /usr/bin/alacritty -e zsh' &)]])
end
keymap("t", "<C-a>", [[<C-u>  xptenv<cr><cmd>lua _OPEN_TERMINAL_NVIM()<cr>i<C-d>]], term_opts)
