set nocompatible              " be iMproved, required
filetype off                  " required

"""""""""""""""""""""""""""""""""""""""" Get OS """"""""""""""""""""""""""""""""""""""""
function MySys()
	if has("win32") || has ("win64")
		return "Windows"
	elseif has("mac")
		return "Mac"
	else
		return "Linux"
	endif
endfunc

"""""""""""""""""""""""""""""""""""""""" Set Shell """"""""""""""""""""""""""""""""""""""""
if MySys() == "Mac" || MySys() == "Linux"
	set shell=bash\ -l
endif

"""""""""""""""""""""""""""""""""""""" Basic Settings """""""""""""""""""""""""""""""""""""
filetype on
filetype plugin on

syntax enable
syntax on

set t_Co=256
set autochdir
set autoindent
set autoread
set cursorline
set cursorcolumn
set foldenable
set foldmethod=marker
set guioptions-=T
set history=500
set hlsearch
set incsearch
set lazyredraw
set nobackup
set noexpandtab 
set number
set softtabstop=4
set shiftwidth=4
set tabstop=4
set ruler
set smarttab
set smartindent
set scrolloff=5
set formatoptions=qlmM
set textwidth=100
"set cc=100

"""""""""""""""""""""""""""""""""""""" Key maps """"""""""""""""""""""""""""""""""""""""
imap <c-o> <cr><esc>kA

""""""""""""""""""""""""""""" Auto-pair in visual mode """""""""""""""""""""""""""""""""
function VisualModePair(chl, chr)
	:DelimitMateOff
	let [bufnum, lnum, col, off] = getpos("'<")
	call setpos(".", [bufnum, lnum, col, off])
	execute "normal i" . a:chl

	let [bufnum, lnum, col, off] = getpos("'>")
	if col != 0x7FFFFFFF
		let col = col + 1
	endif
	call setpos(".", [bufnum, lnum, col, off])
	execute "normal a" . a:chr
	:DelimitMateOn
endfunction

:vnoremap ' :call VisualModePair("'", "'")<cr>
:vnoremap " :call VisualModePair('"', '"')<cr>
:vnoremap ( :call VisualModePair("(", ")")<cr>
:vnoremap ) :call VisualModePair("(", ")")<cr>
:vnoremap [ :call VisualModePair("[", "]")<cr>
:vnoremap ] :call VisualModePair("[", "]")<cr>
:vnoremap { :call VisualModePair("{", "}")<cr>
:vnoremap } :call VisualModePair("{", "}")<cr>

""""""""""""""""""""""""""""""""""""""" Bundle """""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'https://github.com/gcmt/wildfire.vim.git'

Plugin 'godlygeek/tabular'

" GUI
if has('gui_running')

set lines=40 columns=160
set guifont=Monaco:h12

Plugin 'moonsilho/taglist.vim'
""" taglist settings """ {{{
"let Tlist_Auto_Open=1
let Tlist_Show_Menu=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Use_Right_Window=1
map <silent> <leader>tl :TlistToggle<cr>
"""}}}

Plugin 'scrooloose/nerdtree'
""" nerdtree settings """{{{
let NERDChristmasTree=1
let NERDTreeQuitOnOpen=0
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
"""}}}

Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'rizzatti/dash.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'rking/ag.vim'
""" ag.vim settings """ {{{
let g:ag_prg="ag --column"
"""}}}
Plugin 'dyng/ctrlsf.vim'
""" CtrlSF settings """ {{{
nnoremap <C-F> :CtrlSF<space>
"""}}}
Plugin 'nathanaelkane/vim-indent-guides'
""" vim-indent-guides settings """ {{{
let g:indent_guides_enable_on_vim_startup=1
"""}}}
Plugin 'klen/python-mode'
""" python-mode settings """ {{{
let pymode_rope = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_lint_ignore="E128,E225,E303,E501"
"""}}}
Plugin 'Konfekt/FastFold'
""" FastFold settings """ {{{
let g:fastfold_savehook = 0
"""}}}
Plugin 'scrooloose/syntastic'
""" Syntastic settings """ {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"""}}}
Plugin 'Valloric/YouCompleteMe'
""" YouCompleteMe settings """ {{{
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
"""}}}
Plugin 'jeaye/color_coded'
Plugin 'rdnetto/YCM-Generator'
Plugin 'kien/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
""" ultisnips settings """ {{{
" Trigger configuration. If use <tab>, must reset <tab> of YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="II"
let g:UltiSnipsJumpBackwardTrigger="OO"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
"""}}}
Plugin 'mattn/calendar-vim'
""" calendar settings """ {{{
let g:calendar_diary="~/Onedrive/Configs/Diary/"
"""}}}
Plugin 'iamcco/markdown-preview.vim'
""" Markdown-Preview settings """ {{{
let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
"""}}}

endif

" Color schemes
Plugin 'molokai'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required

""""""""""""""""""""""""""""""""""""""" Other Settings """""""""""""""""""""""""""""""""""""""""

"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


""""""""""""""""""""""""""""" Specify Interpreter """"""""""""""""""""""""""""""""""""""
let g:ycm_path_to_python_interpreter = '/System/Library/Frameworks/Python.framework/Versions/2.7/bin/python'


"""""""""""""""""""""""""""""""" Color Schemes """""""""""""""""""""""""""""""""""""""""
colorscheme molokai

:python colorschemes = ['molokai', 'lucius', 'solarized']
:python icolor = 0
:python bkgrnd = 'black'

function! ChangeColorScheme()
python << EOF
import vim
if bkgrnd == 'dark':
	bkgrnd = 'light'
	vim.command('set background=light')
	vim.command('colo {:s}'.format(colorschemes[icolor]))
else:
	bkgrnd = 'dark'
	vim.command('set background=dark')
	icolor = (icolor+1)%len(colorschemes)
	vim.command('colo {:s}'.format(colorschemes[icolor]))
EOF
endfunction

map <F3> :call ChangeColorScheme()<cr>

""""""""""""""""""""""""""""""""" File encodes """"""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030

" Change encoding
:python encodes = ['utf-8', 'gb2312', 'bgk', 'gb18030', 'koi8-r']
:python ienc = 0

function! NextEncode()
python << EOF
import vim
ienc = (ienc+1)%len(encodes)
vim.command('e ++enc={:s} %'.format(encodes[ienc]))
print 'encoding: {:s}'.format(encodes[ienc])
EOF
endfunction

map <F2> :call NextEncode()<cr>

""""""""""""""""""""""""""""""""""" File Types """"""""""""""""""""""""""""""""""""""""""
au BufNewFile *.py call <SID>insert_python_coding()
fu! s:insert_python_coding()
    exec "norm i#! /usr/bin/env python\n"
    exec "norm i# -*- coding:utf-8 -*-\n"
	endfu



