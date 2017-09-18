" Load plugins via vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-jedi'
Plug 'fishbullet/deoplete-ruby'
Plug 'tpope/vim-endwise' " insert 'end' automatically


" colorschemes
Plug 'freeo/vim-kalisi'
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'iCyMind/NeoSolarized'

" git
Plug 'tpope/vim-fugitive'

" hud
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" deoplete autocompleteion with TAB
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>" 

" deoplete options
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" clang completion
let g:deoplete#sources#clang#libclang_path='/usr/lib64/libclang.so.4'
let g:deoplete#sources#clang#clang_header='/usr/lib64/clang'

" jedi completion
let g:deoplete#sources#jedi#python_path='/usr/bin/python3'


" close scratch window aautomatically
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" make ',' leader
let mapleader = ","
let g:mapleader = ","

" whitespace
set wrap  " wrap lines visually ...
set linebreak  " ... but not in the middle of a word (uses breakat)
set textwidth=79 " break up lines at 79 characters
set tabstop=2 " size of tab (that gets translated to spaces via expandtab)
set shiftwidth=2 " size of indent used by autoindent (/smartindent/cindent)
set expandtab " use spaces instead of tabs

" Enable filetype specific configurations in ~/.config/nvim/filetype.vim
filetype plugin indent on


" delete trailing whitespace on save (python files)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" show line numbers
set number

" cursor
set scrolloff=3
set matchpairs+=<:>

" reload files when changed externally
set autoread

" move in wrapped lines
nnoremap j gj
nnoremap k gk

" quicksaving
nmap <leader>w :w!<cr>

" sudo save
command W w !sudo tee % > /dev/null

"searching
set ignorecase
set smartcase
"set hlsearch
set incsearch

" disable search highlight on <leader><enter>
map <silent> <leader><cr> :noh<cr>

" theme
colorscheme gruvbox
set background=dark
set termguicolors

" cursor
set guicursor=a:blinkon0
au VimLeave * set guicursor=a:block

" fix Windows ^M (<leader>m)
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" create .htm from markdown on save using pandoc
func! ExportToHTM()
    silent! execute "!pandoc -f commonmark -t html -o " . expand("%:r") . ".htm " . expand("%") 
"    execute "!pandoc -f commonmark -t html -o " . expand("%:r") . ".htm " . expand("%") 
endfunc
"autocmd BufWritePost *.md :call ExportToHTM()
