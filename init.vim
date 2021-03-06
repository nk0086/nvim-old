"plugin settings {{{
"listing

let s:dein_dir = expand('~/.config/nvim/plugins')
let s:dein_repo_dir = s:dein_dir . '/dein.vim'
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
	execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')

endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
    call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()

endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()

endif
"}}}

"settings
inoremap jj <ESC>
"インサートモードでカーソル移動
inoremap <C-f> <C-g>U<Right>
inoremap <C-f><C-f> <C-g>U<ESC><S-a>
"us配列用
nnoremap ; :
set number
set smartindent
set shiftwidth=4
set softtabstop=4
set autochdir
set encoding=utf-8
set wildmode=longest,full
set wildmenu
set noswapfile

syntax enable
"colorscheme iceberg
colorscheme zellner

let mapleader = "\<Space>"

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.snip setl noexpandtab
augroup END

"エディタとターミナルを移動する
tnoremap <C-t> <C-\><C-n><C-w>k
nnoremap <C-t> <C-w>ji
tnoremap jj <C-\><C-n>

"function {{{
function! MakeSnippet() abort
    :!cargo snippet % > ~/.config/nvim/neosnippet-snippets/rust/%<.snip
endfunction
command! MakeSnippet call MakeSnippet()

command! -nargs=? Sub call Submit(<f-args>)
function! Submit(...) abort
    if a:0 >= 1
	if a:1 == "go"
	    :! acc s -s -- -y
	else 
	    :! python3 $HOME/program/rust/auto_test/submit.py %<
	endif
    else
	:! cargo compete s %<
    end
endfunction

command! -nargs=? Test call Test(<f-args>)
function! Test(...) abort
    if a:0 >= 1
	if a:1 == "go"
	    :! oj t -c "go run main.go"
	else 
	    :! python3 $HOME/program/rust/auto_test/test.py %<
	endif
    else 
	:! cargo compete t %<
    end
endfunction
"}}}

"eskk settings {
imap jk <Plug>(eskk:toggle)
cmap jk <Plug>(eskk:toggle)
"}
