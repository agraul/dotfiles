"Load plugins via vim-plug
call plug#begin('~/.local/share/nvim/plugged')

"completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-jedi'

"colorschemes
Plug 'freeo/vim-kalisi'
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'iCyMind/NeoSolarized'

call plug#end()

" deoplete for autocompleteion with TAB
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>" 

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" clang completion
let g:deoplete#sources#clang#libclang_path='/usr/lib64/libclang.so.4'
let g:deoplete#sources#clang#clang_header='/usr/lib64/clang'

" jedi completion
let g:deoplete#sources#jedi#python_path='/usr/bin/python3'
" close scratch window aautomatically
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" show line numbers
set number

" make ',' leader
let mapleader = ","
let g:mapleader = ","

" whitespace
set wrap
set textwidth=79
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" delete trailing whitespace on save (python files)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" cursor
set scrolloff=3
set matchpairs+=<:>

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
    execute "!pandoc -f commonmark -t html -o " . expand("%:r") . ".htm " . expand("%") 
endfunc
autocmd BufWritePost *.md :call ExportToHTM()
