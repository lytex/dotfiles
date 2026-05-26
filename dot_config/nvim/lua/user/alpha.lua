local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	-- https://github.com/yufernando/dotfiles/blob/master/vim/vim_ascii.txt
	[[    .,         .                                                                  ]],
	[[  .coo,        dc.                                                                ]],
	[[ .,lddllc.      oool.                                           ▟▙                ]],
	[[ ;;;:ollll'     ooooo                                           ▝▘                ]],
	[[ ;;;;;,llll:    lllll   ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖    ]],
	[[ ,,,,,  ccccc'  lllll   ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██    ]],
	[[ ,,,,,   .cccc;.ccccc   ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██    ]],
	[[ ,,,,,     :::::ccccc   ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██    ]],
	[[ ',,,,      ':::lc:::   ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀    ]],
	[[   ',,        ::ccc                                                               ]],
	[[    .         ':                                                                  ]],
}
dashboard.section.buttons.val = {
	dashboard.button(
		"p",
		"  Find project",
		"<cmd>lua require('telescope').extensions.project.project{display_type = 'full'}<cr>"
	),
	dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "󰄉  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button(
		"t",
		"󰊄  Find text",
		"<CMD>lua require('telescope.builtin').live_grep({debounce = 100, theme= 'ivy'})<CR>"
	),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "󰅚   Quit Neovim", ":qa<CR>"),
}

local function footer()
	-- NOTE: requires the fortune-mod package to work
	local handle = assert(io.popen("fortune"))
	local fortune = handle:read("*a")
	handle:close()
	return fortune
	-- return "chrisatmachine.com"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
