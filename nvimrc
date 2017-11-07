" Load plugins via vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-jedi'
Plug 'fishbullet/deoplete-ruby'

" colorschemes
Plug 'morhetz/gruvbox'

" tpope
Plug 'tpope/vim-surround' " Brackets etc.
Plug 'tpope/vim-fugitive' " Git
Plug 'tpope/vim-endwise' " Ruby 'end'
Plug 'tpope/vim-bundler' " Bundler integration
Plug 'tpope/vim-rails' " Rails integration

Plug 'alvan/vim-closetag' " Close HTML tags
Plug 'nvie/vim-flake8'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/syntastic'

" statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" open fzf with CTRL-P
nnoremap <C-p> :FZF <CR>

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

" closetag
let g:closetag_filenames = '*.html, *.xhtml, *.htm, *.html.erb, *.htm.erb'
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = ',>'

" airline config
"let g:airline_theme='solarized'
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" close scratch window aautomatically
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" make ',' leader
let mapleader = " "
let g:mapleader = " "

" whitespace
set wrap " visual only
set linebreak " don't break words (see :h breakat)
set textwidth=79 " line lenght
set tabstop=4 " size of tab
set shiftwidth=4 " indent by autoindent
set expandtab " insert spaces in place of tabs

" Enable filetype specific configurations in ~/.config/nvim/filetype.vim
filetype plugin indent on

" split on right side
set splitright

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
cmap W w !sudo tee % > /dev/null

"searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" disable search highlight on <leader><enter>
map <silent> <leader><cr> :noh<cr>

" move between buffers
nnoremap <silent> <C-b> :silent :bp<CR>
nnoremap <silent> <C-n> :silent :bn<CR>

" open/close error list
nnoremap <silent> <leader>L :lclose<CR>
nnoremap <silent> <leader>O :lopen<CR>

" insert blank line without entering insert mode
nnoremap <CR> o<Esc>

" Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

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
