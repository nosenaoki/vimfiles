if has('vim_starting')
  set nocompatible               " Be iMproved
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'gmarik/vundle'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'hallettj/jslint.vim'
"Bundle 'marijnh/tern_for_vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'fatih/vim-go'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Rykka/riv.vim'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

syntax on
filetype on

set wildmode=list:full
set expandtab
set nobackup
set noswapfile
set hidden
set smartindent
set completeopt=menu

"command line key mapping
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

"normal mode key mapping
nnoremap <C-L> :tabn<CR>
nnoremap <C-H> :tabp<CR>
nnoremap <C-T> :tabnew<CR>
nnoremap <C-X> :QuickRun<CR>

"smart semicolon
inoremap <S-Enter> <End>;<CR>
inoremap <C-Space> <C-X><C-O>

"VimFiler
nnoremap <Leader>f :VimFilerBufferDir<CR>
let g:vimfiler_as_default_explorer = 1

"Unite
nnoremap <Leader>u :Unite file_mru<CR>
nnoremap <Leader>r :UniteResume<CR>

let g:unite_enable_start_insert=1

au FileType unite setlocal iminsert=0

au FileType unite nnoremap <buffer> <expr> x unite#do_action('start')
au FileType unite nnoremap <buffer> <expr> r unite#do_action('rename')
au FileType unite nnoremap <buffer> <expr> y unite#do_action('copy')
au FileType unite nnoremap <buffer> <expr> s unite#do_action('split')
au FileType unite nnoremap <buffer> <expr> v unite#do_action('vsplit')
au FileType unite nnoremap <buffer> <expr> <C-R> unite#do_action('rec')
au FileType unite nnoremap <buffer> <expr> I unite#do_action('insert')

"zencoding
let g:user_zen_settings = {
\   'smarty' : {
\     'extends' : 'html',
\     'filters' : 'html,c',
\   },
\}

"generic auto commands
"au BufEnter * lcd %:p:h
au BufEnter *.html,*.xml,*.css,*.tpl,*.scala setlocal shiftwidth=2 tabstop=2 
au BufEnter *.scala setlocal tabstop=2
au BufNewFile *.php call append(0, "<?php")
au BufEnter *.php,*.js,*.java setlocal tabstop=4 shiftwidth=4
au BufWritePre *.js,*.php :%s/\s\+$//e
au BufEnter *.php,*.js,*.java setlocal tabstop=4 shiftwidth=4

set fencs=utf-8
set fenc=utf-8
set nobackup
set noswapfile
"set enc=utf-8
set incsearch
set ruler
set tabstop=4
set shiftwidth=4

set undofile
set undodir=$HOME/.vim/undofiles
set tags=.tags
let g:changelog_username="Naoki NOSE"
set background=dark
colorscheme solarized

if executable('ag')
  let g:unite_source_rec_async_command='ag --nocolor --nogroup --skip-vcs-ignores --ignore ".git" --ignore ".hg" --hidden -g ""'
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif


"NeoComplecache
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'

"vim-go
au FileType go nnoremap <buffer> <C-I> :GoImport 
au FileType go nnoremap <buffer> <C-X> :GoRun<CR>
au FileType go nnoremap <buffer> <C-R> :GoRename<CR>
au FileType go nnoremap <buffer> <C-B> :GoBuild<CR>
au FileType go nnoremap <buffer> <C-D> :GoDoc<CR>
au FileType go setl noexpandtab

"riv.vim
let g:riv_highlight_code  = 'lua,python,cpp,javascript,vim,sh,php'

"syntastic
let g:syntastic_php_checkers = ['php']
let g:syntastic_html_tidy_exec = 'tidy5'
