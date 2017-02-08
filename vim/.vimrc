" ---------------------------------------------------------------------------- "
"                                    Options                                   "
" ---------------------------------------------------------------------------- "

set autoindent
set backspace=indent,eol,start
set colorcolumn=80,120
set complete+=kspell
set cursorline
set encoding=utf8
set expandtab
set ffs=unix,dos,mac
set fileencoding=utf-8
set hidden
set hlsearch
set ignorecase
set incsearch
set lazyredraw
set linebreak
set magic
set modelines=0
set mouse=a
set nobackup
set nocompatible
set noerrorbells
set nojoinspaces
set noswapfile
set novisualbell
set nowritebackup
set number
set numberwidth=5
set ruler
set scrolloff=5
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set smartindent
set smarttab
set softtabstop=4
set spelllang=en,fr
set splitbelow
set splitright
set t_vb=
set tabstop=4
set textwidth=120
set ttyfast
set wildmenu
set wildmode=list:full
set wrap

" ---------------------------------------------------------------------------- "
"                                    More Options                              "
" ---------------------------------------------------------------------------- "

filetype plugin indent on

" COLORS
set t_Co=256
syntax enable
colorscheme custom
"autocmd FileType * setlocal formatoptions-=c

" Return to last position when opening files
autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif
" Remember info about open buffers on close
set viminfo^=%

"autocmd BufNewFile,BufRead *.tex let g:indentLine_enabled=0

autocmd FileType c,cpp,sh,zsh,make,python,vim setlocal tw=80
autocmd FileType tex setlocal spell tw=120
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType gitcommit setlocal spell tw=72
autocmd FileType markdown setlocal spell tw=120
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

let NERDTreeShowHidden=1

" ---------------------------------------------------------------------------- "
"                            Python specific (PEP8)                            "
" ---------------------------------------------------------------------------- "

" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" For full syntax highlighting:
let python_highlight_all=1

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" ---------------------------------------------------------------------------- "
"                              ale syntax checker                              "
" ---------------------------------------------------------------------------- "

" let g:ale_sign_column_always = 0
let g:ale_lint_on_save = 1
" let g:ale_lint_on_text_changed = 0
" let g:ale_lint_on_enter = 0
let g:ale_sign_error = '⨉ '
let g:ale_sign_warning = '⚠ '
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_c_gcc_options ='-std=c11 -Wall -Wextra -Wshadow -Wpedantic -Wformat=2'

" ---------------------------------------------------------------------------- "
"                                Plugin Airline                                "
" ---------------------------------------------------------------------------- "

if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

set laststatus=2
let g:airline_detect_modified = 1
let g:airline_detest_spell = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='term'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#error_symbol = '⨉ '
let g:airline#extensions#ale#warning_symbol = '⚠ '

" ---------------------------------------------------------------------------- "
"                                Plugin Startify                               "
" ---------------------------------------------------------------------------- "

function! s:filter_header(lines) abort
   let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
   let centered_lines = map(copy(a:lines),
            \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
   return centered_lines
endfunction

let g:startify_custom_header = s:filter_header([
         \ '                     .',
         \ '     ##############..... ##############',
         \ '     ##############......##############',
         \ '       ##########..........##########',
         \ '       ##########........##########',
         \ '       ##########.......##########',
         \ '       ##########.....##########..',
         \ '       ##########....##########.....',
         \ '     ..##########..##########.........',
         \ '   ....##########.#########.............',
         \ '     ..#################000...........',
         \ '       ################.............',
         \ '       ##############.000.0000000000',
         \ '       ############...00...00..00  00',
         \ '       ##########....00...00..00  00',
         \ '       ########......000..000 000 000',
         \ '       ######    .........',
         \ '                   .....',
         \ '                     .',
         \ ])

let g:startify_show_files_number = 25
let g:startify_list_order = ['files', 'dir']
hi StartifyHeader ctermfg=2
hi StartifyPath   ctermfg=8
hi StartifyFile   ctermfg=13

" ---------------------------------------------------------------------------- "
"                              line number toggle                              "
" ---------------------------------------------------------------------------- "

function! NumberToggle()
 if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set nonumber
    set relativenumber
  endif
endfunc

" ---------------------------------------------------------------------------- "
"                                tab completion                                "
" ---------------------------------------------------------------------------- "

" will insert tab at beginning of line,
" will use completion if not at beginning
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" ---------------------------------------------------------------------------- "
"                                  Keybindings                                 "
" ---------------------------------------------------------------------------- "

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" :H <topic> open help in current buffer
command! -nargs=1 -complete=help H :enew | :set buftype=help | :h <args>

let mapleader = ","
let g:mapleader = ","
map <silent> <leader><cr> :noh<cr>
imap <C-L> <Esc>

" Fast saving
nmap <leader>w :w!<cr>

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <S-K> 10k
nnoremap <S-J> 10j

" Tabs
nnoremap <C-i> :tabprevious<CR>
nnoremap <C-o> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>

" NerdTree (control + space to toggle)
nnoremap <NUL> :NERDTreeToggle<CR>
nnoremap <C-m> :TagbarToggle<CR>

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" ,ss to toggle spell checking
map <leader>ss :setlocal spell!<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Toggle syntastic
nnoremap <leader>c :SyntasticToggleMode<CR>

" avoid annoying window
map q: :q

" good use for arrow keys: L/R for indentation; U/D move lines around
nnoremap <Left> <<
nnoremap <Right> >>
vnoremap <Left> <gv
vnoremap <Right> >gv
nnoremap <Up> :m .-2<CR>==
nnoremap <Down> :m .+1<CR>==
vnoremap <Up> :m '<-2<CR>gv=gv
vnoremap <Down> :m '>+1<CR>gv=gv

" number toggle
nnoremap<leader>n :call NumberToggle()<CR>

" navigate between errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
