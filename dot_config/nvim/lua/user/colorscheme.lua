vim.cmd([[
try
 if system("cat ~/.config/plasmarc | grep dark || true") == ""
    colorscheme solarized
		augroup illuminate_augroup
        autocmd!
        autocmd VimEnter * hi! illuminatedWord guibg=#eeeeee gui=NONE
				autocmd VimEnter * hi! IlluminatedWordText  guibg=#eeeeee gui=NONE
				autocmd VimEnter * hi! IlluminatedWordRead  guibg=#eeeeee gui=NONE
				autocmd VimEnter * hi! IlluminatedWordWrite guibg=#eeeeee gui=NONE
    augroup END
  else
    colorscheme vim-monokai-tasty
    set termguicolors " Make vim-illuminate work
		augroup illuminate_augroup
        autocmd!
        autocmd VimEnter * hi! illuminatedWord guibg=#4e4e4e gui=NONE
				autocmd VimEnter * hi! IlluminatedWordText  guibg=#4e4e4e gui=NONE
				autocmd VimEnter * hi! IlluminatedWordRead  guibg=#4e4e4e gui=NONE
				autocmd VimEnter * hi! IlluminatedWordWrite guibg=#4e4e4e gui=NONE
    augroup END
  endif
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
