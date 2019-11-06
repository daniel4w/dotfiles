let mapleader =","

		
" Install vim-plug and Plugins
	if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
	endif

	call plug#begin('~/.config/nvim/plugged')
	Plug 'bling/vim-airline'
	Plug 'tpope/vim-surround'
	call plug#end()


" Basics
	set bg=light
	set go=a
	set mouse=a
	set nohlsearch
	set clipboard+=unnamedplus
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	colorscheme vimbrains
	set splitbelow splitright

" Enable autocompletion
	set wildmode=longest,list,full

" Navigate windows with 'Alt+{h,j,k,l}
	:tnoremap <A-h> <C-\><C-N><C-w>h
	:tnoremap <A-j> <C-\><C-N><C-w>j
	:tnoremap <A-k> <C-\><C-N><C-w>k
	:tnoremap <A-l> <C-\><C-N><C-w>l
	:inoremap <A-h> <C-\><C-N><C-w>h
	:inoremap <A-j> <C-\><C-N><C-w>j
	:inoremap <A-k> <C-\><C-N><C-w>k
	:inoremap <A-l> <C-\><C-N><C-w>l
	:nnoremap <A-h> <C-w>h
	:nnoremap <A-j> <C-w>j
	:nnoremap <A-k> <C-w>k
	:nnoremap <A-l> <C-w>l

" Show syntax highlighting groups for word under cursor
	nmap <C-S-P> :call <SID>SynStack()<CR>
	function! <SID>SynStack()
	  if !exists("*synstack")
	    return
	  endif
	  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
	endfunc

" Start next run_tests.sh in upper directory
	nmap <C-d> :vsp term://run_itests <C-R>=expand('%:p:h')<cr><cr>

" Use ESC in terminal mode
    :tnoremap <Esc> <C-\><C-n>

" Update init.vim after editing
	autocmd BufWritePost ~/.config/nvim/init.vim :so $MYVIMRC
