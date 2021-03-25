""""""""""""""""""""
"   vim-plug.vim   "
""""""""""""""""""""
" vim-plug"
" vim_starting によって起動時のみに実行したい部分を切り分けられる"

if has('vim_starting')
    set rtp+=~/.vim/plugged/vim-plug
    if !isdirectory(expand('~/.vim/plugged/vim-plug'))
        "~ を expand に通すことで展開させる."
        "/User/username のように"
        echo 'install vim-plug...'
        call system('mkdir -p ~/.vim/plugged/vim-plug')
        " -p で中間ディレクトリを作成 (.vim とか vim-plug "
        " に至るまでに存在しないディレクトリがある場合は, "
        " それも含めて作成する )"
        call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
    endif
endif

" plug-in list"
call plug#begin('~/.vim/plugged')
"call plug#begin('~/.local/share/nvim/plugged')
    "Plug 'github name / directory name'"
	" editing
	Plug 'junegunn/vim-plug', {
	  \ 'dir': '~/.vim/plugged/vim-plug/autoload'}
	"Plug 'Townk/vim-autoclose' 
	Plug 'Lokaltog/vim-easymotion'
	Plug 'Yggdroot/indentLine'
	Plug 'machakann/vim-sandwich'
	Plug 'cohama/lexima.vim'
	Plug 'scrooloose/nerdcommenter'

	" utilities
	Plug 'vim-scripts/gtags.vim'
	Plug 'majutsushi/tagbar'
	Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
	Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
	Plug 'junegunn/vim-peekaboo'
	Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
	Plug 'rking/ag.vim'

	" completion and linting
	Plug 'w0rp/ale'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	if has('nvim')
	  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	else
	  Plug 'Shougo/deoplete.nvim'
	  Plug 'roxma/nvim-yarp'
	  Plug 'roxma/vim-hug-neovim-rpc'
	endif
	Plug 'Shougo/neco-vim'
	Plug 'Shougo/neco-syntax'

	Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

	" colorschemes
	Plug 'tomasr/molokai'
	Plug 'altercation/vim-colors-solarized'
	Plug 'dracula/vim'
	Plug 'cocopon/iceberg.vim'
    Plug 'Haron-Prime/Antares'
    Plug 'freeo/vim-kalisi'
    Plug 'rafalbromirski/vim-aurora'

	" MarkDown
	Plug 'kannokanno/previm'
	Plug 'plasticboy/vim-markdown'
	Plug 'tyru/open-browser.vim'

	" Latex
	Plug 'lervag/vimtex'
call plug#end()

"""""""""""""""""""""
"   Initialization  "
"""""""""""""""""""""
" autocmd の複数回割り当てを防ぐ (現在これが活きている様子は見られない...?)"
augroup vimrc
	autocmd!
augroup END

"""""""""""""""""""""
"   Filetype        "
"""""""""""""""""""""
" ファイル形式別のプラグインとインデントのロードを有効化 "
filetype plugin indent on

"""""""""""""""""""""
"   Previm          "
"""""""""""""""""""""
" markdown がプレビューできる vim プラグイン "
augroup PrevimSettings
	autocmd!
	autocmd BufNewFile, BufRead *.{md, mdwn, mkd, mkdn, mark*} set filetype=markdown
augroup END

"""""""""""""""""""""
"   Editing         "
"""""""""""""""""""""
" set foldmethod=marker "
" foldmethod というオプションに文字列 "marker" を設定する"
" = の両側にスペースを入れることはできない. "

" let msg = "marker""
" msg という変数に文字列 "marker" を設定する"

"折りたたみ機能の無効化"
" foldenable を無効に設定すると全ての折りたたみが開く. "
" オプションを無効に設定するためには, オプション名の前に no をつける "
set nofoldenable

" 文字のエンコーディングを設定"
set encoding=utf-8
" 改行コードを自動認識"
" 左端から順に試して合致したところで開く"
" unix : LF (\n), Windows : CR+LF (\r\n), Mac : CR (\r)"
set fileformats=unix,dos,mac
" 全角文字を正しく表示する"
set ambiwidth=double
" １つ前の行に基づくインデント "
set autoindent
" autoindent と同様だがいくつかの C 構文を認識し, 適切な箇所のインデントを増減させる"
set smartindent
" バックアップファイルを生成しない "
set nobackup
" スワップファイルを生成する "
set swapfile
" 開いているが vim 上で変更のないファイルについて, 外部で変更があった際に自動的に読み込み直すか？"
set autoread
"エラーメッセージの表示時にピープ音を鳴らさない"
set noerrorbells
" 括弧を閉じた時対応する括弧に一時的に移動しない"
set nostartofline
" vim が挿入するインデントやシフトオペレータ (>>) で挿入/削除されるインデントの幅を画面上の見た目で何文字分かを指定する."
set shiftwidth=4
" <TAB> を含むファイルを開く際, タブ幅をスペース 4 つ分にする"
set tabstop=4
" 挿入モードで tab キー押下時やインデントの際,
" 「タブ文字」ではなく半角スペースが挿入されるようになる."
" このオプションが有効のとき, 本当のタブ文字を入力したい場合は, <C-v> <TAB> とする"
" 「タブ文字を入れる」ことと「半角スペースを複数インデントのために入れる」ことは異なることに注意.
" shiftwidth と tabstop の値を変えて見てみると違いがより明瞭になる."
set expandtab
"<TAB> をキーボードで入力した際, <TAB> を何文字の空白に変換するかを設定"
set softtabstop=4
"shiftwidth の設定が可能となる."
"行頭で <TAB> を押したとき, shiftwidth 分のスペースが挿入される."
" 挿入されたスペースの数が tabstop の値に達した場合, expandtab がオフなら <TAB> に変換される." 
set smarttab
" スクロール開始位置 画面上下のスクロール時に余裕を持ってスクロールさせる"
set scrolloff=5
" 補完マップの長さ "
set pumheight=10
" バックスペースを有効化 "
" indent : allow backspacing over autoindent "
" eol : allow backspacing over line breaks (join lines) "
" start : allow backspacing over the start of insert. CTRL-W and CTRL-U "
" stop once at the start of insert. "
set backspace=indent,eol,start
" 起動時メッセージを無効化 "
" I は Vim の開始時に挨拶メッセージを表示しない."
" export PATH=$PATH:~... と同じ要領で += で色々なフラグを追加できる. "
set shortmess+=I
" クリップボードを初期化"
" set {option}& で option を規定値に設定する"
set clipboard&
" 無名レジスタに入るデータを * レジスタにも入れる"
" * レジスタにデータを入れるとクリップボードにデータが入るので "
" vim で yank, cut した text を他のアプリケーションで "
" 即ペーストして使用できる "
"set clipboard+=unnamed
"クリップボードを有効化"
if has("nvim")
    set clipboard=unnamedplus
else
    set clipboard=unnamed,autoselect,unnamepdplus
endif
" on のとき, マウスが使用可能になる. a は全モード "
set mouse=a
" 文字列 (規定では "(:),{:},[:]") バッファについてカッコなどの "
" 組みを構成する文字. コマンド % で片方からもう片方にジャンプできる "
" ただし, 違う文字の組のみなので, ダブルクウォートで囲まれた区間は "
" ジャンプ出来ない. "
" 値に HTML 用として <> を設定する場合は <:> を加える "
set matchpairs& matchpairs+=<:>

""""""""""
"   UI   "
""""""""""
syntax on
set number
" 特殊文字の可視化 "
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
" カーソルが何行目何列目に置かれているかを表示"
set ruler
set wrap
set title
set showcmd
" set showmatch
" set matchtime-1
set cursorline
set display=lastline
" コマンドライン補完が拡張モードで行われる "
set wildmenu

""""""""""""
" Colors   "
""""""""""""
call togglebg#map("<F5>")

if $TERM =~? '.*-256color' && has('termguicolors')
    " 環境変数 $TERM はユーザが利用している端末の種類を知るため "
    " =~? は正規表現 "
    " ~ 最後に置換された文字列に置換する "
    "set termguicolors "
    autocmd ColorScheme * highlight Normal ctermbg=none
    autocmd ColorScheme * highlight LineNr ctermbg=none
    set bg=dark
   colorscheme default
    if !has('nvim') && $TERM =~? 'screen'
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        " t_8f は文字色 "
        " & は擬似変数を表す "
        " &varname で vim オプション (定義がある場合は local option,
        " 定義がない場合は global option ) "
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        " t_8b は背景色"
    endif
endif

"置換時にプレビューする"
if exists('+inccommand')
    set inccommand=split
endif

"""""""""""""""""""""
"  Search           "
"""""""""""""""""""""
" インクリメンタルな検索 "
" default では検索ワードを入力後に検索が実行されるが "
" incsearch を有効にすることによって, 文字を入力した "
" 時点での検索結果が表示されるようになる. "
set incsearch
" 検索結果をハイライト表示する "
set hlsearch
" 大文字小文字を区別しない "
set ignorecase
" 大文字が検索パターンにある場合 ignorecase を無効化する "
set smartcase
" 検索がファイル末尾まで行ったらファイル先頭から再開する "
set wrapscan

"""""""""""""""""""""
" Keybindings       "
"""""""""""""""""""""
" map コマンド一覧表"
"
"登録コマンド	        削除コマンド	モード
":map  :noremap		:unmap		ノーマル、ビジュアル、選択、オペレータ待機
":nmap :nnoremap	:nunmap		ノーマル
":vmap :vnoremap	:vunmap		ビジュアル、選択
":smap :snoremap	:sunmap		選択
":xmap :xnoremap	:xunmap		ビジュアル
":omap :onoremap	:ounmap		オペレータ待機
":map! :noremap!	:unmap!		挿入、コマンドライン
":imap :inoremap	:iunmap		挿入
":lmap :lnoremap	:lunmap		挿入、コマンドライン、Lang-Arg
":cmap :cnoremap	:cunmap		コマンドライン

" no-remap 系は, ユーザが定義した他のマップに影響を受けずに,"
" 何も設定されていない「素の」 Vim (vim のデフォルト的な？)"
" キーバインドに割り当てるためのコマンド"

" Leader Key "

inoremap jj <ESC>

noremap j gj 
"gj はスクリーン行で下へ移動"
noremap k gk
"gk はスクリーン行で上へ移動"
noremap gj j
"j は普通に行ごとで下へ移動"
noremap gk k
"k は普通に行ごとで上へ移動"

noremap ; :
noremap : ;


