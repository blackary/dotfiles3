" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
filetype plugin indent on

set nocompatible "Doesn't have to be compatible with vi
set path+=** "Allow find by relative path from current directory

set modelines=0 "Disables modelines

set expandtab "Turns <TAB> into spaces
set smarttab "Use tabs for indentation and spaces for alignment
set shiftwidth=4 "Affects what happens when you press >>, etc.
set tabstop=4 "Changes the width of the <TAB> character
set softtabstop=4 "Somehow different from tabstop...?
set autoindent "Copy indentation from previous line when going to next line
set colorcolumn=80 "Creates a colored line showing where 80 characters is
set fileformat=unix "Saves files in unix format by default

func! DeleteTrailingWS() "Deletes trailing whitespace
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS() "Delete whitespace in py files

set encoding=utf-8
set scrolloff=3 "Leaves 3 lines visisble when scrolling to top or bottom of page
set showmode "Shows if 'Visual' line is on
set showcmd "Shows current command going on
set nohidden "When closing buffers, they must be saved
set wildmenu "Autocomplete in command line with <TAB>
set wildmode=list:full,full "On first tab, select longest common match, on second tab, scroll through options
set visualbell "Don't make a beep sound
set t_vb=      "Make visual bell do nothing
set cursorline "Highlight current line
set ttyfast "Allow fast scrolling
set ruler "Display current line, column, percentage on bottom of page
set backspace=indent,eol,start "Make backspace work 'normally', i.e. going back to previous line when it should
set laststatus=2 "Always display status line
"set relativenumber "Show relative line numbers on left side
"set number "Show absolute line number for the current line
set undofile "Save file that tracks edits of each file

set complete-=i "Don't search included files

let mapleader = "," "Make , work as leader key, instead of \

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

set wrap
set textwidth=74
set formatoptions=qrn1

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

nnoremap ; :

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>a :Ack!
if executable('ag')
  let g:ackprg = 'ag'
endif

map <leader>n :NERDTreeToggle<CR>

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END


set foldmethod=indent
set foldlevelstart=20

"Fold and unfold by pressing space instead of za
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR> 
vnoremap <Space> zf

"Remap capital W and Q to work the same as w and q
:command WQ wq
:command Wq wq
:command W w
:command Q q

syntax on

" Ignore files in command-t searches
set wildignore+=*.pyc
set wildignore+=*.orig
set wildignore+=~*
set wildignore+=*.scssc

" Make control-p open with c-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Make control-p open in the current directory, or in the git main
" directory
let g:ctrlp_working_path_mode = 'ra'

" Allow ctrl-T to switch tabs in macvim
if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif

set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Make Control-A select all
map <C-a> <esc>ggVG<CR>

" Make the highlighting in vimdiff not awful
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" Change color of 80 column to not be awful
highlight ColorColumn ctermbg=233 guibg=#2c2d27 
highlight Search cterm=NONE ctermfg=grey ctermbg=blue

" set macvim to start in a project folder
"if has("gui_macvim")
    "cd ~/Desktop/snippets/
"endif

" Auto-run flake8 (py syntac checker) on file save
"autocmd BufWritePost *.py call Flake8()

" Allow crontab editing with vim
autocmd filetype crontab setlocal nobackup nowritebackup

" Use up to toggle line numbers on and off
noremap <up> :set number!<CR> \| :set rnu!<CR>

" Automatically switch to paste mode
" from https://github.com/ryanpcmcquen/fix-vim-pasting
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

set undodir=/tmp//
set backupdir=/tmp//
set directory=/tmp//

" Open vertical splits on the right of current buffer
set splitright

" Quickly open a buffer for scribble
map <leader>q :vs ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :vs ~/buffer.markdown<cr>

let b:ale_linters = ['eslint']
let g:jedi#usages_command = "<leader>q"

if $TMUX == ''
    set clipboard+=unnamed
endif
