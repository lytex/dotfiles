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
  augroup end

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
