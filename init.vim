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
colorscheme iceberg

let mapleader = "\<Space>"

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.snip setl noexpandtab
augroup END

"エディタとターミナルを移動する
tnoremap <C-t> <C-\><C-n><C-w>k
nnoremap <C-t> <C-w>ji
tnoremap jj <C-\><C-n>

function! MakeSnippet() abort
    execute '!cargo snippet % > ~/.config/nvim/neosnippet-snippets/rust/%<.snip <CR>'
endfunction
command! MakeSnippet call MakeSnippet()

"引数を渡して、test or submit を決める
"デフォルトは test
function! SubmitCode() abort
    :! cargo compete t %< <CR>
    :! cargo compete s %< <CR>
endfunction
command! SubmitCode call SubmitCode()

filetype on
augroup atcoder_judge
    autocmd!
    autocmd FileType rust nmap <buffer> <F4> :! cargo snippet % > ~/.config/nvim/neosnippet-snippets/rust/%<.snip <CR>
    autocmd FileType rust nmap <buffer> <F5> :! python3 $HOME/program/rust/auto_test/test.py %< <CR>
    autocmd FileType rust nmap <buffer> <F6> :! python3 $HOME/program/rust/auto_test/submit.py %< <CR>
    autocmd FileType rust nmap <buffer> <F7> :! cargo compete t %< <CR>
    autocmd FileType rust nmap <buffer> <F8> :! cargo compete s %< <CR>

augroup END

imap jk <Plug>(eskk:toggle)
cmap jk <Plug>(eskk:toggle)

"filetype on
"augroup edit_text 
"    autocmd!
"    autocmd FileType markdown nmap <C-t> :! pandoc % -f markdown -o %<.pdf --pdf-engine=lualatex <CR>
"    autocmd FileType plaintex,tex nmap <C-p> :! latexmk -pvc % <CR>
"augroup END

