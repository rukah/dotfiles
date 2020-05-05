" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

" ENV
let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME

" Load rc file
function! s:load(file) abort
    let s:path = expand('$CONFIG/nvim/rc/' . a:file . '.vim')

    if filereadable(s:path)
        execute 'source' fnameescape(s:path)
    endif
endfunction

call s:load('plugins')

"--------------------------------------------"
" 表示関連
"--------------------------------------------"
syntax on             " シンタックスハイライトを有効にする
set title             " タイトルをウィンドウ枠に表示
set number            " 行番号を表示する
set ruler             " ルーラーを表示する
set showcmd           " 入力中のコマンドをステータスに表示する
set laststatus=2      " ステータスラインを常に表示
set showmatch         " 括弧入力時に対応する括弧を表示
set matchtime=2       " 対応する括弧の表示時間を2にする
set hlsearch          " 検索結果文字列のハイライトを有効にする
set wildmenu          " コマンドライン補完を拡張モードにする
set textwidth=0       " 入力されているテキストの最大幅
set wrap              " ウィンドウの幅より長い行は折り返して、次の行に続けて表示する

" コメント文の色を変更
highlight Comment ctermfg=DarkCyan

" 全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif

" ステータスラインに表示する情報の指定
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>

" ステータスラインの色
highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white

"--------------------------------------------"
" 操作関連
"--------------------------------------------"
set backspace=indent,eol,start

"--------------------------------------------"
" インデント
"--------------------------------------------"
set autoindent                " オートインデントを有効にする
set smartindent               " 新しい行を作った時に高度な自動インデントを行う
set tabstop=2                 " タブが対応する空白の数
set softtabstop=2             " タブやバックスペース等の操作時にタブが対応する空白の数
set shiftwidth=2              " インデントの各段階に使われる空白の数
set noexpandtab               " タブを挿入するときに代わりに空白を使わない
set expandtab                 " 空白を挿入する時に適切な空白を使う
set smarttab                  " 行頭の余白内で Tab を打ち込むと、shiftwidth の数だけインデントする
set whichwrap=b,s,h,l,<,>,[,] " カーソルを行頭、行末で止まらないようにする
set ambiwidth=double

"--------------------------------------------"
" 国際化関連
"--------------------------------------------"
" 文字コードの指定
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932
set fileencodings+=,ucs-2le,ucs-2,utf-8

"--------------------------------------------"
" 検索関連
"--------------------------------------------"
set history=100       " コマンド、検索パターンを100個まで履歴に残す
set ignorecase        " 検索時に大文字と小文字を区別しない
set smartcase         " 検索時に大文字が含まれている場合は区別して検索する
set nowrapscan        " 最後まで検索しても先頭に戻らない
set incsearch         " インクリメンタルサーチをする
set inccommand=split  " 文字列置換をインタラクティブに表示

"--------------------------------------------"
" オートコマンド
"--------------------------------------------"
if has("autocmd")
    " ファイルタイプ別インデント、プラグインを有効にする
    filetype plugin indent on
    " カーソル位置を記憶する
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line ("$") |
        \   exe "normal g`\"" |
        \ endif
endif

"--------------------------------------------"
" その他
"--------------------------------------------"
set hidden          " バッファを切り替えてもundoの効力を失わない
set shortmess+=I    " 起動時のメッセージを表示しない
"set splitbelow     " 分割窓は下に表示
set splitright      " 分割窓は右に表示
set nobackup        " バックアップを作成しない
set nowritebackup   " ファイルの上書き前にバックアップを作らない
set conceallevel=0

" マウス操作を有効
if has('mouse')
  set mouse=a
endif

"--------------------------------------------"
" キーマッピング
"--------------------------------------------"
" Normal Mode
cnoremap init :<C-u>edit $MYVIMRC<CR>		" init.vim呼び出し
noremap <Space>s :source $MYVIMRC<CR>		" init.vim読み込み
noremap <Space>w :<C-u>w<CR>         		" ファイル保存

" Insert Mode
inoremap <silent> jj <ESC>:<C-u>w<CR>           " InsertMode抜けて保存
" Insert mode movekey bind
inoremap <C-d> <BS>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>

" <Leader>を<Space>に変更
let mapleader = "\<Space>"

" C-L: ハイライト解除
nnoremap <C-L> :nohl<CR><C-L>

" <Space><Space>: ビジュアルラインモード
nmap <Space><Space> V

" v を押すたび拡大選択, <C-v>で戻す
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

