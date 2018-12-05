" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Bundle "gmarik/vundle"
Bundle "scrooloose/nerdtree"
Bundle "majutsushi/tagbar"
Bundle "scrooloose/nerdcommenter"
Bundle "vim-scripts/c.vim"
Bundle "vim-scripts/peaksea"
Bundle "Valloric/YouCompleteMe"
Bundle "vim-scripts/sudo.vim"
Bundle "Chiel92/vim-autoformat"
Bundle "vim-scripts/DoxygenToolkit.vim"
Bundle "Shougo/denite.nvim"
filetype indent plugin on

set history=700

" Enable filetype plugin
filetype plugin on
filetype indent on

" cuda highlight
au BufNewFile,BufRead *.cu set ft=cuda
au BufNewFile,BufRead *.cuh set ft=cuda

" Set to auto read when a file is changed from the outside
set autoread

let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

" Fast editing of the .vimrc
map <leader>ee :e! ~/.vimrc<cr>
"Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>

" 有些插件的function后没加!,老报错
autocmd! bufwritepost .vimrc source ~/.vimrc

" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu

set ruler "Always show current position

set cmdheight=2 "The commandbar height

set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l,[,]

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

syntax enable "Enable syntax hl

set shell=/bin/bash

set t_Co=256
colorscheme peaksea
set background=dark
" 不显示行号
set nonu

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"Persistent undo
try
    set undodir=~/.vim/undodir
    set undofile
catch
endtry


set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Some useful keys for vimgrep
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
" vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" From an idea by Michael Naumann
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

func! Cwd()
    let cwd = getcwd()
    return "e " . cwd
endfunc

func! DeleteTillSlash()
    let g:cmd = getcmdline()
    if MySys() == "linux" || MySys() == "mac"
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    endif
    if g:cmd == g:cmd_edited
        if MySys() == "linux" || MySys() == "mac"
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        endif
    endif
    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc

"Useful when moving accross long lines
map j gj
map k gk

" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

" Smart way to move btw. windows
map <C-down> <C-W>j
map <C-up> <C-W>k
map <C-left> <C-W>h
map <C-right> <C-W>l

" Return to last edit position (You want this!) *N*
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

"Remeber open buffers on close
set viminfo^=%

" Always hide the statusline
set laststatus=2

function! CurDir()
    return substitute(getcwd(), '/Users/amir/', "~/", "g")
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L}

" Do :help cope if you are unsure what cope is. It's super useful!
" map <leader>cc :botright cope<cr>
" map <leader>n :cn<cr>
" map <leader>p :cp<cr>

" 隐藏标题栏和工具栏
" set go-=m
" set go-=T

fun! MySys()
    return "$1"
endfun

" gvim配置
set guioptions-=T "隐藏工具栏
set guioptions-=m " 隐藏菜单栏
set guioptions-=b
set guioptions-=l "隐藏左边滚动条
set guioptions-=L
set guioptions-=r "隐藏右边滚动条
set guioptions-=R
" set guifont=WenQuanYi\Micro\Hei\ 14
set guifont=monospace\ 12

set langmenu=zh_CN.UTF-8                 "设置菜单语言
source $VIMRUNTIME/delmenu.vim    "导入删除菜单脚本，删除乱码的菜单
source $VIMRUNTIME/menu.vim          "导入正常的菜单脚本
language messages zh_CN.utf-8          "设置提示信息语言


" asy高亮
au BufNewFile,BufRead *.asy set syntax=asy
au BufNewFile,BufRead *.asy set ft=asy

" hi高亮
au BufNewFile,BufRead *.hi set syntax=c
au BufNewFile,BufRead *.hi set ft=c

" pentadactly 配置文件高亮
au BufRead,BufNewFile .pentadactylrc set filetype=pentadactyl
au! Syntax pentadactyl source ~/.vim/addons/Areslp/syntax/pentadactyl.vim

set nocompatible
set encoding=utf-8
set fileencodings=utf-8,gbk,big5

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


"格式化
" noremap <S-F> <Esc>:%! astyle<CR>
noremap <S-F> <Esc>:Autoformat<CR>
" au BufWrite * :Autoformat
" Save & Make
nnoremap <F8> :w<CR>:make<CR>

" 粘贴
set nopaste
set pastetoggle=<F12>

" 代码格式化设置，可用gq格式化部分代码
autocmd BufNewFile,BufRead *.c set formatprg=astyle
autocmd BufNewFile,BufRead *.h set formatprg=astyle
autocmd BufNewFile,BufRead *.cpp set formatprg=astyle

" 切换Quickfix列表
map <F6> <ESC>:call QFSwitch()<CR>
function! QFSwitch()
    redir => ls_output
    execute ':silent! ls'
    redir END

    let exists = match(ls_output, "[Quickfix 列表")
    if exists == -1
        execute ':copen'
    else
        execute ':cclose'
    endif
endfunction

set foldmethod=syntax
set foldnestmax=1

"Persistent undo
try
    if MySys() == "windows"
        set undodir=C:\Windows\Temp
    else
        set undodir=~/.vim_runtime/undodir
    endif

    set undofile
catch
endtry


" a.vim
let g:alternateExtensions_h = "cpp"
let g:alternateExtensions_H = "CPP"
let g:alternateExtensions_cpp = "h,hpp"
let g:alternateExtensions_CPP = "H,HPP"
let g:alternateExtensions_c = "h"
let g:alternateExtensions_C = "H"
let g:alternateExtensions_cxx = "h"
noremap <leader>a :A<CR>
let g:NERDTree_title='NERD Tree'
function! NERDTree_Start()
    exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction
"NERDTree
noremap <leader>f :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeHighlightCursorline=1
let NERDChristmasTree=1
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=41
let NERDTreeChDirMode=2
let NERDTreeIgnore=['.*\.o$']
let NERDTreeIgnore+=['.*\~$']
let NERDTreeIgnore+=['.*\.out$']
let NERDTreeIgnore+=['.*\.so$', '.*\.a$']
let NERDTreeBookmarksFile='/home/l/.vim/NerdBookmarks'

" 注释插件
map <f4> ,c<space>
let NERDSpaceDelims=1       "让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看

" snipMate
let g:snips_trigger_key='<c-\>'

map <leader>t :TagbarToggle<cr>

set nocscopeverbose

" YouCompleteMe
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf="~/.ycm_extra_conf.py"
let g:ycm_collect_identifiers_from_tags_files = 0

" set tab width
set ts=4
set sw=4
set softtabstop=4
set expandtab
set autoindent
" set expandtab
" set shiftwidth=4
" set tabstop=4
" set smarttab

nmap <leader>d :Dox<cr>

set cc=80

map <leader>b :Denite buffer<cr>
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
