"  __________________________________
" /\                                 \
" \_| Granville Barnett's Vim Config |
"   | granvillebarnett@gmail.com     |
"   |   _____________________________|_
"    \_/_______________________________/
 
" the basics
set nocompatible
filetype off " vundle requires this

" *****************************************************************************
" /////////////////////////////// BASIC STUFFF ////////////////////////////////
" *****************************************************************************

set t_Co=256
set ruler "always show current positions along the bottom
set hlsearch
set hidden " lusty explorer
" following three variables make use of spaces instead of tabs
set expandtab
set shiftwidth=2
set softtabstop=2
set nu "show line numbers
set so=20 " some vertical buffering of current buffer 
set ignorecase
set incsearch
set autoindent " just indent on your own!!!!
set vb " visual bell because audible bell pisses me off
set nobackup
set noswapfile
" never go over 80 cols. 
set tw=80
set wrap
" use q to easily format text. I like this from Emacs using M-q
map q gq}
" set current working directory to that of the file being edited
set autochdir
" show path of file being edited.
set modeline
set ls=2
" show incomplete commands
set showcmd
"set spell
set spelllang=en_gb
"set cursorline
"set cursorcolumn
syntax on 
filetype plugin on 
filetype indent on
" Limit popup menu height
set pumheight=15
set completeopt-=preview " don't like it
set background=dark

let mapleader=";" 

" custom mappings
nmap <leader>d :bd<CR>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>m :make<CR>
nmap <leader>o :only<CR>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>

" reload vimrc when tweaked
au bufwritepost .vimrc source $MYVIMRC

" open buffer at pos. where you were last 
au BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif 

au BufEnter * :only

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"
