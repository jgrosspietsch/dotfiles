set shell=/bin/sh

if has('vim_starting')
	if &compatible
		set nocompatible
	endif

	set runtimepath+=/Users/Joe/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('/Users/Joe/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'NLKNguyen/papercolor-theme'
NeoBundle 'fatih/vim-go'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'bling/vim-airline'
NeoBundle 'Blackrush/vim-gocode'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'ahayman/vim-nodejs-complete'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'wlangstroth/vim-racket'

call neobundle#end()

set t_Co = 256
set background = light
colorscheme PaperColor
set number
syntax on

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
"        \ <SID>check_back_space() ? "\<TAB>" :
"        \ neocomplete#start_manual_complete()
"  function! s:check_back_space() "{{{
"    let col = col('.') - 1
"    return !col || getline('.')[col - 1]  =~ '\s'
" endfunction"}}}

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplete#close_popup() . "\<CR>"
"  " For no inserting <CR> key.
"  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

let g:neocomplete#enable_auto_select = 1

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" vim-go
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" delimitMate
let delimitMate_expand_cr = 1

" rainbow_parentheses.vim
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" vim-airline
let g:airline_powerline_fonts = 0
let g:airline_symbols = {}

" vim-nodejs-complete

filetype plugin indent on
filetype plugin on

NeoBundleCheck
