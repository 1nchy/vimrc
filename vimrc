" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

"""""""""""""""""""""
" VIM CONFIGURATION 
"""""""""""""""""""""
syntax on				" syntax highlight
set number                      " show line numbers
set cindent                     " C language style indentation
set showmatch           " matching mode
set tabstop=4
set shiftwidth=4
set cursorline          " hightlight the line of the cursor
set hlsearch            " hightlight matching string
set foldmethod=syntax
set guicursor=a:underline,n:block
hi Search term=standout ctermfg=none ctermbg=229
hi Cursorline term=standout cterm=none ctermfg=none ctermbg=254
" set clipboard=unnamed
autocmd BufWinLeave ?* silent mkview
autocmd BufWinEnter ?* silent loadview
" autocmd InsertLeave * :silent !fcitx5-remote -c
" set fencs=utf-8,GB18030,ucs-bom,default,latin1
let g:input_toggle = 0
function! Fcitx2en()
	let s:input_status = system("fcitx5-remote")
	if s:input_status == 2
		let g:input_toggle = 1
		let l:a = system("fcitx5-remote -c")
	else
		let g:input_toggle = 0
	endif
endfunction

function! Fcitx2zh()
	let s:input_status = system("fcitx5-remote")
	if s:input_status != 2 && g:input_toggle == 1
		let l:a = system("fcitx5-remote -o")
	endif
endfunction

set ttimeoutlen=150
autocmd InsertLeave ?* call Fcitx2en()
autocmd InsertEnter ?* call Fcitx2zh()
