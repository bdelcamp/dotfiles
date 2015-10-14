set nocompatible              " be iMproved, required"
filetype off                  " required

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
" Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
" --------------------PLUGINS----------------------

" syntax
Plugin 'rstacruz/sparkup'
Plugin 'docunext/closetag.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
	" syntax - languages
	" Plugin ''

" git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" interface
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'mhinz/vim-startify'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/goyo.vim'

" colorschemes
Plugin 'w0ng/vim-hybrid'

" ---------------------END PLUGINS-------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ----------------------------------------------------

syntax on
set mouse=a
set clipboard=unnamedplus
set ttymouse=xterm2
set nu
set tabstop=4

" colorscheme
set t_Co=256
set background=dark
let g:hybrid_use_Xresources = 1
colorscheme hybrid

" powerline
let g:airline_theme="hybridline"
set noshowmode
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_powerline_fonts = 1

" keybinds
map <S-x> :bd<CR>
map <S-k> :bp<CR>
map <S-j> :bn<CR>
map <C-n> :NERDTreeToggle<CR>
let g:multi_cursor_next_key='<C-d>'

" nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" colors
set cursorline
hi CursorLineNr ctermfg=grey
hi CursorLine ctermbg=none

" YCM
let g:ycm_autoclose_preview_window_after_completion=1

" utilsnipso
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Goyo 
function! s:goyo_enter()
  " silent !tmux set status off
  set noshowmode
  set noshowcmd
  set scrolloff=999
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
  " ...
endfunction

function! s:goyo_leave()
  " silent !tmux set status on
  set showmode
  set showcmd
  set scrolloff=5
  set cursorline
  hi CursorLineNr ctermfg=grey
  hi CursorLine ctermbg=none
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

