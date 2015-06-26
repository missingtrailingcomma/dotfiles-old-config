" STYLE
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nu
set hls
set ai
set cursorline
set hlsearch
let mapleader = "-"
" nnoremap <leader>d dd

" MAP
nnoremap <space> <esc>viw
noremap <c-u> <esc>viwU
noremap <c-l> <esc>viwu
inoremap <</ <esc>?<<return>lyiw/><return>a</<esc>pa>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
inoremap jk <esc>

" ABBRE
iabbrev adn and
iabbrev waht wha

" OMNICOMPLETE
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" AUTOCMD
autocmd BufWritePre,BufRead *:normal gg=G
autocmd FileType javascript,c nnoremap <buffer> <leader>comm I//<esc>

"OPEN MESSAGE
"echo "\nKeep Calm and Shut the Fuck Up\n"

filetype plugin indent on
syntax on








