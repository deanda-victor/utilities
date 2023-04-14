set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plugin 'arcticicestudio/nord-vim'
Plugin 'remmen/vim-ripgrep'
Plugin 'goballooning/vim-conque'
Plugin 'hashivim/vim-terraform'
Plugin 'frazrepo/vim-rainbow'
" Visualise the tree structure of a file
Plugin 'mbbill/undotree'
Plugin 'evansalter/vim-checklist'
" Asynchronous Linters
Plugin 'dmerejkowsky/vim-ale'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8

let python_highlight_all=1
syntax on
set nu
set clipboard=unnamed

" Status line 
set laststatus=2
let g:lightline = { 'colorscheme': 'powerline', }

au BufNewFile,BufRead *.py,*.kv
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix


" Allows backspace on breaking lines
set backspace=indent,eol,start

" Keeps cursor while scrolling
set so=999

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch

"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Toggle Darkmode
call togglebg#map("<F5>")

" Coc Thingys
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Allows COC selection with <TAB>
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

nnoremap <S-k> :m-2<CR>
nnoremap <S-j> :m+<CR>
" inoremap <S-k> <Esc>:m-2<CR>
" inoremap <S-j> <Esc>:m+<CR>

" Better colors in Python code
colorscheme nord

" Map FZF Quick open
" Remember to use Ctrl+T to open a new tab
map <leader>f :FZF<CR>

" Map Rg Quick open
map <leader>g :Rg<CR>


" Map for windows management
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-y> :vertical resize +5<CR>
nnoremap <C-t> :vertical resize -5<CR>

" Higlight while typing
set incsearch

" Playing with FZF  window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

" Allows mouse manipulation
set mouse=a

" Ignore case when searching 
set ignorecase

" Syntastic linting configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pyflakes']

nnoremap <leader>ct :ChecklistToggleCheckbox<cr>
nnoremap <leader>ce :ChecklistEnableCheckbox<cr>
nnoremap <leader>cd :ChecklistDisableCheckbox<cr>
vnoremap <leader>ct :ChecklistToggleCheckbox<cr>
vnoremap <leader>ce :ChecklistEnableCheckbox<cr>
vnoremap <leader>cd :ChecklistDisableCheckbox<cr>

nnoremap <C-x> :ChecklistToggleCheckbox<cr>
" Retain history after closing the file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" Autocomplete commas and things
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Run Python super fast"
nnoremap <leader>r :!python %<CR>

