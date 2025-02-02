source $VIMRUNTIME/macros/matchit.vim

" setting
"文字コードをUFT-8に設定
set encoding=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,euc-jp,cp932
set fileencodings=utf-8
set fileformats=unix,dos,mac
set shortmess-=S

scriptencoding utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 80桁と120目にラインを入れる
set colorcolumn=80,120
" autocmd! OptionSet textwidth call s:SetColorColumn()
" function! s:SetColorColumn()
"     if &textwidth == 0
"         setlocal colorcolumn=80
"     else
"         setlocal colorcolumn=&textwidth
"     endif
" endfunction
" クリップボードへのコピーを有効にする
set clipboard+=unnamed
" deleteの設定の変更
set backspace=indent,eol,start
let mapleader="g"

" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
"タブ自体を移動する
nnoremap gl :+tabm
nnoremap gh :-tabm
"シンタックスを表示する
syntax enable

" インサートモードでカーソルの形状変更
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


" キーの割り当て
" 検索のハイライトをescの連打で消す
noremap <ESC><ESC> :noh<Enter>
" NERDTreeをショートカットで出す
noremap <S-t> :NERDTreeTabsToggle<Enter>
" ctrl-pで連続して貼り付けられるようにする
vnoremap <silent> <S-p> "0p<CR>
noremap <S-h>   ^
noremap <S-l>   $

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch

" スペルチェックを有効
set spell
set spelllang=en,cjk

" 独自のシンタックスハイライト
autocmd BufRead,BufNewFile *.rb setfiletype ruby
autocmd BufRead,BufNewFile Schemafile setfiletype ruby

autocmd BufNewFile,BufRead *.php setfiletype php
autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html

" 起動時に実行するもの
" NERDTree
if argc() == 0 && !exists("s:std_in")
let g:nerdtree_tabs_open_on_console_startup=1
end

" NERDTreeの設定
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1

" javascript
let g:jsx_ext_required = 0
let g:typescript_indent_disable = 0
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.js, *.vue"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.erb'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'

" ctrlpの設定
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" let g:ctrlp_working_path_mode = 'a'

" FZFの設定
" ctrl p でFZFを起動
noremap <silent> <C-p> :FZF<CR>
function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

nnoremap <silent> <C-b> :call FZFOpen(':Buffers')<CR>
nnoremap <silent> <C-g>g :call FZFOpen(':Ag')<CR>
nnoremap <silent> <C-g>c :call FZFOpen(':Commands')<CR>
nnoremap <silent> <C-g>l :call FZFOpen(':BLines')<CR>
nnoremap <silent> <C-p> :call FZFOpen(':Files')<CR>

" vim-trailing-whitespaceの設定
let g:extra_whitespace_ignored_filetypes = ['']

" NERDCommenterの設定
let g:NERDSpaceDelims = 1

" vim-vueの設定
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

" vim-markdownの設定
let g:vim_markdown_folding_disabled = 1
au BufRead,BufNewFile *.{md,MD} set filetype=markdown

" previmの設定
let g:previm_disable_default_css = 1
let g:previm_custom_css_path = '~/dotfiles/templates/previm/github.css'
let g:previm_enable_realtime = 1

" neocomplete.vimの設定
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#max_list = 50
let g:neocomplete#max_keyword_width = 80
let g:neocomplete#enable_ignore_case = 1
highlight Normal ctermbg=none guibg=NONE
highlight Pmenu ctermbg=6
highlight PmenuSel ctermbg=3
highlight PMenuSbar ctermbg=0

"カラースキームを設定
set background=dark
" colorscheme tender
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight Normal guibg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
autocmd ColorScheme * highlight LineNr guibg=none
colorscheme solarized
" colorscheme NeoSolarized
" colorscheme molokai

" prettierの設定
" if filereadable(findfile('.prettierrc', '.;'))
"   echo "Using prettier..."
"   autocmd BufWritePre *.js,*.jsx,*mjs,*.ts,*.tsx,*.json,*.vue PrettierAsync
" endif
" let g:prettier#autoformat = 0
" au FileType plantuml command! OpenUml : !start chrome %

" F1でヘルプが開くのを無効化
nmap <F1> <nop>
imap <F1> <nop>
set ttimeoutlen=10

" emmetの設定
let g:user_emmet_leader_key='<C-h>'

" プラグインのセットアップ
" Plug ''
call plug#begin('~/.vim/plugged')
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-rails'
Plug 'jistr/vim-nerdtree-tabs'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/neocomplcache-rsense.vim'
Plug 'preservim/nerdcommenter'
Plug 'alvan/vim-closetag'
Plug 'cohama/lexima.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'gpanders/editorconfig.nvim'
Plug 'altercation/vim-colors-solarized'
Plug 'posva/vim-vue'
Plug 'plasticboy/vim-markdown'
Plug 'tyru/open-browser.vim'
Plug 'previm/previm'
Plug 'posva/vim-vue'
Plug 'bronson/vim-trailing-whitespace'
Plug 'chr4/nginx.vim'
Plug 'prettier/vim-prettier'
Plug 'aklt/plantuml-syntax'
Plug 'slim-template/vim-slim'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'github/copilot.vim'
Plug 'neoclide/coc.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jwalton512/vim-blade'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'mattn/emmet-vim'
Plug 'ishan9299/nvim-solarized-lua'
Plug 'shaunsingh/solarized.nvim'
" Plug 'Bekaboo/deadcolumn.nvim'
call plug#end()

" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   highlight = {
"     enable = true,
"     disable = {
"       'vim',
"       'ruby',
"     }
"   }
" }
" EOF
