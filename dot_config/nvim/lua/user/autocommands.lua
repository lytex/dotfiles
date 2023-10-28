-- https://github.com/NickP-real/.dotfile/blob/main/.config/nvim/lua/core/autocmd.lua

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
-- Persistent Folds
local save_fold = augroup("Persistent Folds", { clear = true })
autocmd("BufWinLeave", {
	pattern = "*.*",
	callback = function()
		vim.cmd.mkview()
	end,
	group = save_fold,
})
autocmd("BufWinEnter", {
	pattern = "*.*",
	callback = function()
		vim.cmd.loadview({ mods = { emsg_silent = true } })
	end,
	group = save_fold,
})

-- Persistent Cursor
autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
    " Open all folds by default
    autocmd BufReadPost,FileReadPost * normal zR
  augroup end

  augroup _nvim_tree
    autocmd!
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  " https://stackoverflow.com/questions/67550082/neovim-select-a-language-prompt
  augroup _lsp
    autocmd!
    " Increase timeout to 10000ms for larger files
    autocmd BufWritePre * lua vim.lsp.buf.format(nil, 10000)
    " Different tab/space stops"
    autocmd Filetype yaml,markdown,html,css,json,javascript,sql,lua setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  augroup end


autocmd VimEnter * hi link illuminatedWord Visual

set viewoptions-=options
augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* if &ft !=# 'help' | mkview | endif
    autocmd BufWinEnter *.* if &ft !=# 'help' | silent! loadview | endif
augroup END

  function! ToggleFormatOnSave()
      if !exists('#_lsp#BufWritePre')
        augroup _lsp
          autocmd!
          autocmd BufWritePre * lua vim.lsp.buf.format(nil, 10000)
        augroup end
      else
        augroup _lsp
          autocmd!
        augroup end
      endif
  endfunction]])
