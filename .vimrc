" An example for a vimrc file.
"
" Maintainer: Sahil Mishra <Sahilcode@gmail.com>
" Last change:	2015 Mar 24
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.

set directory^=$HOME/.vim/tmp//

:set number
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin	'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'easymotion/vim-easymotion'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/tpope-vim-abolish'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'mattn/emmet-vim'

call vundle#end()
filetype plugin indent on
autocmd FileType java setlocal omnifunc=javacomplete#Complete



"execute pathogen#infect()
set encoding=utf-8
syntax enable
set background=light
colors slate
"colors Tomorrow-Night-Eighties
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set guifont=tewi\ 14
set laststatus=2
:let g:airline_theme='papercolor'

set expandtab
set shiftwidth=2
set softtabstop=2

let g:indent_guides_auto_colors = 0
autocmd VimEnter,ColorScheme * :hi IndentGuidesOdd guibg=red ctermbg=1
autocmd VimEnter,ColorScheme * :hi IndentGuidesEven guibg=red ctermbg=9

if v:progname =~? "evim"
	finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
	set nobackup		" do not keep a backup file, use versions instead
else
	set backup		" keep a backup file (restore to previous version)
	set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		au!

		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		autocmd BufReadPost *
					\ if line("'\"") >= 1 && line("'\"") <= line("$") |
					\   exe "normal! g`\"" |
					\ endif

	augroup END

else

	set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
	" Prevent that the langmap option applies to characters that result from a
	" mapping.  If unset (default), this may break plugins (but it's backward
	" compatible).
	set langnoremap
endif
"General Mappings
map ; :

"Leader Key mappings
let mapleader="\<Space>"
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>i :NERDTree<CR>
nnoremap <Leader>h :tabp<CR>
nnoremap <Leader>l :tabn<CR>
nnoremap <Leader>j G
nnoremap <Leader>k gg

nnoremap <Leader>w :wa<CR>
nnoremap <Leader>q :wqa<CR>

nnoremap <Leader>s :tabp<CR>
nnoremap <Leader>p :tabe<CR>
nnoremap <Leader>e <C-w>
"Other Keymaps
ino ;; <esc>
cno ;; <c-c>
vno ;; <esc>

