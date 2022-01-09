set relativenumber
set number
set nocompatible
filetype plugin on

" 1行あたり80文字超えたラインでハイライトする
let &colorcolumn=join(range(120,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(100,999),",")

"highlight ColorColumn guibg=#202020 ctermbg=yellow

" 検索パターンが一致する時候補すべてハイライト
set hlsearch

"" インデントが空白で行われる
set expandtab

" 検索する時大文字小文字区別しない
set ignorecase

" 検索途中でもハイライトされる
set incsearch

" 大文字を含む検索では大文字を無視しない
set smartcase

" よくわからん
" set nocompatible

"yank した文字列をクリップボードにコピー
set clipboard=unnamed  

" シンタックスハイライトをon
" syntax on

" xで削除した時はヤンクしない
vnoremap x "_x
nnoremap x "_x

" いまいる場所を強調
" 行を強調表示
set cursorline

" 列を強調表示
set cursorcolumn

" jpでescと保存になる
inoremap <silent> jk <ESC>:w<CR>

" <space>wで保存
nnoremap <silent><Space>w :w<CR>

if &compatible
  set nocompatible " Be iMproved
endif

" 編集中でもバッファの移動できるようにする
set hidden

" インデントを良い感じにする
" set autoindent
set tabstop=4
" JS or HTMLの時だけTab幅を変える
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.cu setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.c  setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.cpp  setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.tsx setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.ts setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.json setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END

" LaTeX ----------------------------------
let g:tex_flavor = "latex"
let maplocalleader=' '

