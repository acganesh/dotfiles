" - Vundle Plugin Config - 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'kevinw/pyflakes-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-syntastic/syntastic'
Plugin 'chriskempson/base16-vim'
Plugin 'vim-latex/vim-latex'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tell-k/vim-autopep8'
Plugin 'rakr/vim-one'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" - UI -
syntax on  " Turn on syntax highlighting
set number " Show line numbers
set showcmd " Show partial commands at bottom
set ruler " Show current column number/cursor position
set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu
set showmatch " highlight matching [{()}]

" Searching
set incsearch " Search as characters are entered

" Folding
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max

" space open/closes folds
nnoremap <space> za 

set foldmethod=indent " fold based on indent level

set tabstop=2 " number of visual spaces per tab
set softtabstop=2 " number of spaces a tag counts when editing
set expandtab " tabs are spaces
set shiftwidth=2 " number of columns text is indented with reindent ops (<< and >>)
  
" - Color scheme -

" Credit to joshdick.
" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
" (see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Option A: One Dark
"set background=dark " for the dark version
"colorscheme one

" Option B: Base 16
 colorscheme base16-flat

 " - Completion - "
" Set YCM config for C based languages
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'  
let g:ycm_autoclose_preview_window_after_insertion = 1
set completeopt-=preview

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_min_num_of_chars_for_completion = 1
let g:autopep9_disable_show_diff=1

" - Matching -
" Turn on matchit script  
" % can now matches more than just single chars (tags, etc.)
runtime macros/matchit.vim 

" - Python vimrc -
" source ~/.python_vimrc

" - Syntastic config -
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=E501,E302,E226,E702,E265,W'

" Toggle Syntastic between active/passive modes
" :command Sd SyntasticToggleMode
" Manually check for errors
" :command Sc SyntasticCheck

" - Clipboard -
" Allows yank / put (copy / paste) between different vim sessions
set clipboard=unnamed
" Store copies to temporary buffer.
vmap <leader>y :w! /tmp/vitmp<CR>                                                                 
nmap <leader>p :r! cat /tmp/vitmp<CR>

" - NerdTree -
" Open NerdTree on start, if no files specified.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" - Highlighting HTML with Django awareness -
au BufNewFile,BufRead *.html set filetype=htmldjango

" - Backspace, move from current line -"
" http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=indent,eol,start
