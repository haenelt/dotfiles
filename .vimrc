" VIM configuration
" by Daniel Haenelt

" The following python packages need to be installed:
"     mypy
"     flake8
"     isort
"     black
"     jedi

" Vundle
set nocompatible " required
filetype off     " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'dense-analysis/ale'
Plugin 'nvie/vim-flake8'
Plugin 'morhetz/gruvbox'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'preservim/tagbar'
Plugin 'davidhalter/jedi-vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'sillybun/vim-repl'
Plugin 'Yggdroot/indentLine'
Plugin 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on             " add syntax highlighting
set expandtab         " convert tab to spaces   
set autoindent        " better indentation 
set smartindent       " slightly more powerful than smartindent
set t_Co=256          " use 256 colors
set number            " add line numbers
set foldmethod=indent " folding
set foldlevel=99      " open file unfolded
set cursorline        " highlights the current line
set splitbelow        " position of new split screen
set splitright        " position of new split screen
set encoding=utf-8    " ensure right encoding
set clipboard=unnamed " copy and paste to/from other applications
set ttimeoutlen=50    " switching time between modes
set fileformat=unix   " file format 

" color scheme
syntax enable
set background=light                     " light or dark
let g:gruvbox_contrast_light='hard'      " soft, medium or hard
colorscheme gruvbox
set termguicolors                        " ensure true color support

" color column
highlight colorcolumn ctermbg=238

" REPL
let g:repl_position = 0
let g:repl_height = 24 

" airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.notexists = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1

" NERDTREE
autocmd VimEnter * NERDTree | wincmd p " start NERDTree and put the cursor in the other window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif " exit Vim if NERDTree is the only window remaining in the only tab
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif " close the tab if NERDTree is the only window ramining in it
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif " if another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif " open the existing NERDTree on each new tab

" VIM TMUX Navigator
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-p> :TmuxNavigatePrevious<cr>

" mappings
nnoremap <space> za|                     " button for folding
nnoremap <C-t> :terminal ++rows=24<CR>|  " open terminal with set height
nnoremap <C-r> :REPLToggle<CR>|          " open or close REPL (use <leader>w to send code to REPL)
nnoremap <C-n> :NERDTreeToggle<CR>|      " open or close sidebar
nnoremap <C-m> :TagbarToggle<CR>|        " open or close tagbar
nnoremap <leader>t :stop<CR>|            " go to terminal (go back with fg)
nnoremap <leader>ss :Docstring<CR>|      " insert python docstring
inoremap " ""<left>|                     " close automatically
inoremap ' ''<left>|                     " close automatically
inoremap ( ()<left>|                     " close automatically
inoremap [ []<left>|                     " close automatically
inoremap { {}<left>|                     " close automatically
inoremap {<CR> {<CR>}<ESC>O|             " close automatically
inoremap {;<CR> {<CR>};<ESC>O|           " close automatically

" Function to activate a virtualenv in the embedded interpreter for
" omnicomplete and other things like that.
function LoadVirtualEnv(path)
    let activate_this = a:path . '/bin/activate_this.py'
    if getftype(a:path) == "dir" && filereadable(activate_this)
        python << EOF
import vim
activate_this = vim.eval('l:activate_this')
execfile(activate_this, dict(__file__=activate_this))
EOF
    endif
endfunction

" Load up a 'stable' virtualenv if one exists in ~/.virtualenv
let defaultvirtualenv = $HOME . "/.virtualenvs/stable"

" Only attempt to load this virtualenv if the defaultvirtualenv
" actually exists, and we aren't running with a virtualenv active.
if has("python")
    if empty($VIRTUAL_ENV) && getftype(defaultvirtualenv) == "dir"
        call LoadVirtualEnv(defaultvirtualenv)
    endif
endif
