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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on             " add syntax highlighting
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

" color scheme
colorscheme gruvbox

" airline
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
" Note: You must define the dictionary first before setting values.
" Also, it's a good idea to check whether it exists as to avoid
" accidentally overwriting its contents.

" airline theme
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" NERDTREE
autocmd VimEnter * NERDTree | wincmd p " start NERDTree and put the cursor in the other window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif " exit Vim if NERDTree is the only window remaining in the only tab
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif " close the tab if NERDTree is the only window ramining in it
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif " if another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif " open the existing NERDTree on each new tab

" mappings
nnoremap <space> za|                " button for folding
nnoremap <C-t> :terminal<CR>|       " open terminal
nnoremap <C-n> :NERDTreeToggle<CR>| " open or close sidebar
nnoremap <C-m> :TagbarToggle<CR>|   " open or close tagbar
nnoremap <C-j> <C-w><C-j>|          " split navigation
nnoremap <C-k> <C-w><C-k>|          " split navigation
nnoremap <C-l> <C-w><C-l>|          " split navigation
nnoremap <C-h> <C-w><C-h>|          " split navigation
nnoremap <leader>t :stop<CR>|       " go to terminal (go back with fg)
inoremap " ""<left>|                " close automatically
inoremap ' ''<left>|                " close automatically
inoremap ( ()<left>|                " close automatically
inoremap [ []<left>|                " close automatically
inoremap { {}<left>|                " close automatically
inoremap {<CR> {<CR>}<ESC>O|        " close automatically
inoremap {;<CR> {<CR>};<ESC>O|      " close automatically
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
