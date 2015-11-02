filetype off
filetype plugin indent off

"--------------------------------------------"
" NeoBundle設定
"--------------------------------------------"
if has('vim_starting')
    set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
endif

"--------------------------------------------"
" プラグイン
"--------------------------------------------"
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" 非同期実行ライブラリ: インストール後ビルドが必要
" cd ~/dotfiles/.vim/bundle/vimproc
" make -f make_unix.mak
NeoBundle 'Shougo/vimproc'
" シェル実行
NeoBundle 'Shougo/vimshell'
" 総合ユーザインターフェース
NeoBundle 'Shougo/unite.vim'
" HTML5シンタックス
NeoBundle 'taichouchou2/html5.vim'
" CSS3シンタックス
NeoBundle 'hail2u/vim-css3-syntax'
" Sassシンタックス
NeoBundle 'cakebaker/scss-syntax.vim'
" emmet-vim
NeoBundle 'mattn/emmet-vim'
" コメントアウト
NeoBundle 'scrooloose/nerdcommenter'
" 閉じ括弧を自動化
NeoBundle 'Townk/vim-autoclose'
" コードヒント
NeoBundle 'vim-scripts/AutoComplPop'
" エクスプローラ
NeoBundle 'scrooloose/nerdtree'
" カラースキーマ Desert
NeoBundle 'vim-scripts/desert.vim'
" キーマッピング
NeoBundle "terryma/vim-expand-region"

" Twitter
NeoBundle 'TwitVim'

call neobundle#end()

NeoBundleCheck

"--------------------------------------------"
" 基本設定
"--------------------------------------------"
" カラースキーマ
colorscheme desert
" 改行コードの自動認識
set fileformats=unix,dos,mac
" ビープ音を鳴らさない
set vb t_vb=
" バックスペースキーで削除できるものを指定
" indent : 行頭の空白
" eol    : 改行
" start  : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

"--------------------------------------------"
" バックアップ関連
"--------------------------------------------"
" バックアップをとらない
"set nobackup
" ファイルの上書き前にバックアップを作る
set writebackup
" バックアップを取る
set backup
" バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup
" スワップファイルを作るディレクトリ
set directory=$HOME/swap

"--------------------------------------------"
" 検索関連
"--------------------------------------------"
" コマンド、検索パターンを100個まで履歴に残す
set history=100
" 検索時に大文字と小文字を区別しない
set ignorecase
" 検索時に大文字が含まれている場合は区別して検索する
set smartcase
" 最後まで検索しても先頭に戻らない
set nowrapscan
" インクリメンタルサーチをする
set incsearch

"--------------------------------------------"
" 表示関連
"--------------------------------------------"
" タイトルをウィンドウ枠に表示する
set title
" 行番号を表示する
set number
" ルーラーを表示する
"set ruler
" タブ文字を CTRL-I で表示し、行末に $ で表示する
"set list
" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
" 括弧入力時に対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を2にする
set matchtime=2
" シンタックスハイライトを有効にする
"syntax on
" 検索結果文字列のハイライトを有効にする
set hlsearch
" コメント文の色を変更
highlight Comment ctermfg=DarkCyan
" コマンドライン補完を拡張モードにする
set wildmenu

" 入力されているテキストの最大幅
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" ステータスラインに表示する情報の指定
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
" ステータスラインの色
highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white

"--------------------------------------------"
" インデント
"--------------------------------------------"
" オートインデントを有効にする
set autoindent
" タブが対応する空白の数
set tabstop=4
" タブやバックスペース等の操作時にタブが対応する空白の数
set softtabstop=4
" インデントの各段階に使われる空白の数
set shiftwidth=4
" タブを挿入するときに代わりに空白を使わない
set noexpandtab
" 空白を挿入する時に適切な空白を使う
set expandtab
" 新しい行を作った時に高度な自動インデントを行う
set smartindent
" 行頭の余白内で Tab を打ち込むと、shiftwidth の数だけインデントする
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

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
" バッファを切り替えてもundoの効力を失わない
set hidden
" 起動時のメッセージを表示しない
set shortmess+=I
" 補完候補を表示する
set wildmenu

"--------------------------------------------"
" キーマッピング
"--------------------------------------------"
" <Leader>を<Space>に変更
let mapleader = "\<Space>"

" C-L: ハイライト解除
nnoremap <C-L> :nohl<CR><C-L>

" <Space><Space>: ビジュアルラインモード
nmap <Space><Space> V

" v を押すたび拡大選択, <C-v>で戻す
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" ,,: コメントトグル with NERDCommenter
let NERDSpaceDelims = 1
nmap ,, <plug>NERDCommenterToggle
vmap ,, <plug>NERDCommenterToggle

" ,is: シェルを起動 with VimShell
nnoremap <silent>,is :VimShell<CR>

" C-e: NERDTreeトグル
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" TwitVim
nnoremap <space>po :<C-u>PosttoTwitter<Enter>
nnoremap <space>ut :<C-u>UserTwitter<Enter>
nnoremap <space>fr :<C-u>FriendsTwitter<Enter>
nnoremap <space>re :<C-u>MentionsTwitter<Enter>
nnoremap <space>nn :<C-u>NextTwitter<Enter>
nnoremap <space>pp :<C-u>PreviousTwitter<Enter>
nnoremap <space>st :<C-u>SearchTwitter<Enter>
nnoremap <space>.  :<C-u>RefreshTwitter<Enter>
nnoremap <space>ff :<C-u>ListTwitter ff<Enter>

" !展開の言語設定 with emmet-vim
let g:user_emmet_settings = {
\   'variables': {
\       'lang': 'ja',
\       'charset': 'utf-8'
\   },
\}

