colorscheme wombat
syntax on
filetype on

set wildmode=list:full
set expandtab
set nobackup
set noswapfile
set hidden
set smartindent

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

"Unite
nnoremap <Leader>b :Unite bookmark file<CR>
nnoremap <Leader>f :UniteWithBufferDir file file/new<CR>
nnoremap <Leader>u :Unite buffer file_mru<CR>

au FileType unite setlocal iminsert=0
au FileType unite nnoremap <buffer> <expr> x unite#do_action('start')
au FileType unite nnoremap <buffer> <expr> r unite#do_action('rename')
au FileType unite nnoremap <buffer> <expr> y unite#do_action('copy')
au FileType unite nnoremap <buffer> <expr> s unite#do_action('split')
au FileType unite nnoremap <buffer> <expr> v unite#do_action('vsplit')
au FileType unite nnoremap <buffer> <expr> <C-R> unite#do_action('rec')
au FileType unite nnoremap <buffer> <expr> I unite#do_action('insert')

"PHPUnit
function! RunPHPUnit()
    let test = expand('%:p')
    let dir = fnamemodify(test, ':h')
    let boot = dir . '/Boot.php'
    while ! filereadable(dir . '/Boot.php')
        if dir == '/'
            break
        endif
        let dir = fnamemodify(dir, ':h')
        let boot = dir . '/Boot.php'
    endwhile
    let cmd = 'phpunit --bootstrap ' . boot . ' ' . test
    echo system(cmd)
endfunction
au BufEnter *Test.php nnoremap <buffer> <expr> <Leader>r RunPHPUnit()

"zencoding
let g:user_zen_settings = {
\   'smarty' : {
\     'extends' : 'html',
\     'filters' : 'html,c',
\   },
\}

"auto commands
"au BufEnter * lcd %:p:h
au BufEnter *.html,*.xml,*.css,*.tpl,*.scala setlocal shiftwidth=2 tabstop=2 
au BufEnter *.scala setlocal tabstop=2
au BufNewFile *.php call append(0, "<?php")
au BufEnter *.php,*.js,*.java setlocal tabstop=4 shiftwidth=4
au BufWritePre *.js,*.php :%s/\s\+$//e

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
let g:vimfiler_as_default_explorer = 1

set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimfiler'
Bundle 'ZenCoding.vim'
Bundle 'thinca/vim-quickrun'
"Bundle 'thinca/vim-localrc'
Bundle 'hallettj/jslint.vim'
"Bundle 'delimitMate.vim'
"Bundle 'rosstimson/scala-vim-support'

"Gtags
let Gtags_Auto_Map = 1

filetype plugin on

