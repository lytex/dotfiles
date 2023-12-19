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

local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	return
end

colorizer.setup({ "css", "javascript", "python", "lua", "vim", "toml", "svelte", "typescript" }, {
	RGB = true, -- #RGB hex codes
	RRGGBB = true, -- #RRGGBB hex codes
	names = true, -- "Name" codes like Blue
	RRGGBBAA = true, -- #RRGGBBAA hex codes
	rgb_fn = true, -- CSS rgb() and rgba() functions
	hsl_fn = true, -- CSS hsl() and hsla() functions
	css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
	mode = "background",
})
