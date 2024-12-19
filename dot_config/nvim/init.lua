require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.colorscheme")
require("user.cmp")
require("user.lsp")
require("user.folding")
--[[ require("user.dap") ]]
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.comment")
require("user.gitsigns")
require("user.nvim-neo-tree")
-- require("user.bufferline") -- Overrided by Taboo
require("user.lualine")
require("user.sessions")
require("user.toggleterm")
require("user.project")
require("user.org")
require("user.copilot")

-- require("user.indentline")
require("user.alpha")
require("user.whichkey")
require("user.autocommands")
require("user.firenvim")
require("user.illuminate")

vim.cmd("source ~/.config/nvim/init_vimscript.vim")
vim.cmd("source ~/.config/nvim/yinote.vim")
