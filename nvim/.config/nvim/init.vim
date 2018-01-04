" Load plugins via vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-jedi'
Plug 'fishbullet/deoplete-ruby'
Plug 'carlitux/deoplete-ternjs'

" colorschemes
Plug 'morhetz/gruvbox'
Plug 'nightsense/office'

" tpope
Plug 'tpope/vim-surround' " Brackets etc.
Plug 'tpope/vim-fugitive' " Git
Plug 'tpope/vim-endwise' " Ruby 'end'
Plug 'tpope/vim-bundler' " Bundler integration
Plug 'tpope/vim-rails' " Rails integration

Plug 'nvie/vim-flake8'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" replace this with :make ?
Plug 'scrooloose/syntastic'

" statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" open fzf with CTRL-P
nnoremap <C-p> :FZF <CR>
nnoremap <leader>[ :Buffers <CR>
nnoremap <leader>p :Find <CR>
nnoremap <C-\> :Tags <CR>
nnoremap <F8> :TagbarToggle<CR>

" deoplete autocompleteion with TAB
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" FZF + rg
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" deoplete options
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" clang completion
let g:deoplete#sources#clang#libclang_path='/usr/lib64/libclang.so.4'
let g:deoplete#sources#clang#clang_header='/usr/lib64/clang'

" jedi completion
let g:deoplete#sources#jedi#python_path='/usr/bin/python3'


" airline config
"let g:airline_theme='solarized'
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_left_alt_sep='|'
let g:airline_right_alt_sep='|'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#branch#empty_message = 'NO GIT'

" make '<space>' leader
let mapleader = " "
let g:mapleader = " "

" whitespace
set wrap " visual only
set linebreak " don't break words (see :h breakat)
set textwidth=79 " line length
set tabstop=4 " size of tab
set shiftwidth=4 " indent by autoindent
set expandtab " insert spaces in place of tabs

" Enable filetype specific configurations in ~/.config/nvim/$filetype.vim
filetype plugin indent on

" netrw configuration
let g:netrw_banner = 0
let g:netrw_liststyle = 3
" % of screen that netrw uses
let g:netrw_winsize = 30

" split on right side
set splitright

" show line numbers vim-numbertoggle switches between relative and absolute
set number
set relativenumber

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
cmap w!! w !sudo tee % > /dev/null

" yank and paste from clipboard
nnoremap <leader>y "+y
nnoremap <leader>p "+p

" searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" quick replace (word under cursor "cword")
nnoremap <Space><Space> :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <Space>%       :%s/\<<C-r>=expand('<cword>')<CR>\>/

" disable search highlight on <leader><enter>
map <silent> <leader><cr> :noh<cr>

" open/close error list
nnoremap <silent> <leader>L :lclose<CR>
nnoremap <silent> <leader>O :lopen<CR>


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

" functions

" create .html from markdown using pandoc
function! MDToHTML()
    silent execute "!pandoc -f commonmark -t html -o " . expand("%:r") . ".html " . expand("%")
endfunction
command! MDToHTML call MDToHTML()

" delete trailing whitespace
function! DeleteTrailingWS()
    let l:saved_winview = winsaveview()
    keeppatterns %s/\v\s+$//e
    call winrestview(l:saved_winview)
endfunction
command! DeleteTrailingWS call DeleteTrailingWS()

