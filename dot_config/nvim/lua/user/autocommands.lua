vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
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
    autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync(nil, 10000)
  augroup end

  function! ToggleFormatOnSave()
      if !exists('#_lsp#BufWritePre')
        augroup _lsp
          autocmd!
          autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync(nil, 10000)
        augroup end
      else
        augroup _lsp
          autocmd!
        augroup end
      endif
  endfunction]])
