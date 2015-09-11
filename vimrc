" Modified from:
" https://github.com/awreece/dotfiles/blob/master/vimrc

set nocompatible      " Vim, not Vi

" Vundle initialization startup
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle invocations go here

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Chiel92/vim-autoformat'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'

" Vundle initialization end
call vundle#end()
filetype plugin indent on

syntax on
colorscheme default

" Incremental search. Highlight matching search terms.
" Use smart case-sensitive search.
set incsearch
set hlsearch
set smartcase

" When inserting a bracket, flash the matching bracket.
set showmatch
set matchtime=4

" Always autoindent.
set autoindent

" Faster screen redraws
set ttyfast

" Allow backspacing over autoindent, line breaks, and start of insert
set backspace=2

" Use 3-column line numbers.
set number
set numberwidth=3

" Show contents of all folds. Use syntax for folding.
set foldlevel=0
set foldmethod=syntax

" Show 3 lines of context above and below the cursor.
set scrolloff=3

" Insert a line break after 79 chars. Color column number 80.
set textwidth=79
set colorcolumn=80
highlight ColorColumn ctermbg=darkblue ctermfg=lightgrey guibg=darkblue guifg=lightgrey

" Use 2-space tabs, not hard tabs.
set expandtab
set softtabstop=2
set shiftwidth=2

" Setup the status line: show the mode (insert, replace, etc), show the command,
" and show a 'line#, col#' display. Always show the status line.
set showmode
set showcmd
set ruler
set laststatus=2

" Don't keep a backup file.
set nobackup

" Suffixes that get lower priority when doing tab completion for
" filenames. These are files I am not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.class

" Configure status line.
set statusline=%<\ %f%m				" Filename and modified bit.
set statusline+=\ %{fugitive#statusline()}	" Oooh, git status line.
set statusline+=\ %#warningmsg#			" Start warnin colors	
set statusline+=%{SyntasticStatuslineFlag()}	" Syntastic error message
set statusline+=%*				" End warning colors
set statusline+=%= 				" Start of right aligned.
set statusline+=[%c%V,%l]			" Column number and line number.
set statusline+=\ %P  				" Current line/total lines and
						" percentage.

" Fixup autoformat's astyle linkage. Use a minimum of command line args so we
" pull most settings from .astylerc.
let g:formatdef_astyle_c = '"astyle --mode=c"'
let g:formatdef_astyle_cpp = '"astyle --mode=c"'
let g:formatters_c = ['astyle_c']
let g:formatters_cpp = ['astyle_cpp']

" Configure the syntastic plugin.
" let g:syntastic_auto_loc_list=1		" Auto open error list when errors detected.
" let g:syntastic_loc_list_height=3	" Error list is only 5 lines long.
" let g:syntastic_quiet_warnings=1	" Don't bother me unles there are warnings.

"noremap <C-P> :set invpaste paste?<CR>

set pastetoggle=<C-P>

map <C-N> :set invnumber<CR>

" Automatically save editor state in a view.
au BufWinLeave * mkview
au BufWinEnter * silent loadview

if filereadable(glob("~/.vimrc.local")) 
  source ~/.vimrc.local
endif
