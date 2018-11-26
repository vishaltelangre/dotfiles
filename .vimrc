" vim:set ts=2 sts=2 sw=2 expandtab:

" Execute Pathogen-installed plugins
execute pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" remove all existing autocmds
autocmd!

" enable syntax highlighting
syntax on

" reload file if it is changed outside of vim
set autoread

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list

" enhance cli completion
set wildmenu

" turn on ruler
set ruler

" wrap lines when they are too long
set wrap

" hide buffer (file) instead of abonding when switching
" to another buffer
set hidden

" highlight current line (bluish bg, transparent fg)
set cursorline
:hi CursorLine cterm=NONE ctermbg=17 ctermfg=NONE

" thin cursor
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" allow use of mouse
set mouse=a

" disable backups
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" add line numbers
set number

" display incomplete commands
set showcmd

" always display status (useful for vim-airline)
set laststatus=2

" hide abandoned buffers
set hid

" remember more commands and search history
set history=10000

" show matching brackets
set showmatch
set mat=2

" highlight search results
set hlsearch
set incsearch
nnoremap \ :noh<cr> " clear the search highlight with "\", "n" to restart search

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

" trim trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" make ',' a <Leader>
let mapleader=","

" theme settings
"set background=dark
"colorscheme solarized

" Vim sessions default to capturing all global options, which includes the 'runtimepath' that pathogen.vim manipulates. This can cause other problems too, recommonded way is to turn that behavior off:
set sessionoptions-=options

" unicode compatibility
set encoding=utf-8

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" keep more context when scrolling off the end of a buffer
set scrolloff=3

" fix slow O inserts
:set timeout timeoutlen=1000 ttimeoutlen=100

" Normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1

" Modelines (comments that set vim options on a per-file basis)
set modeline
set modelines=3

" Disable visual bells
" enable vim's internal visual bell
set visualbell
" set the effect of the vim visual bell to do nothing,
set t_vb=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INDENTATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" turn on auto indentation
set autoindent

" use tabs, indent two (not four)
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FOLDING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" fold by indentation
set foldmethod=indent

" set deepest fold to 10 levels
set foldnestmax=10

" don't fold code by default
set nofoldenable

" set fold level to 1
set foldlevel=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" MULTIPLE SELECTION
" use ctrl+v to select next match (similar to Sublime's CMD+D)
let g:multi_cursor_next_key='<C-v>'

" EMMET
" expand items with tab
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" NERDTREE
" toggle NERDTree easily
nmap <C-n> :NERDTreeToggle<CR>

" MISC
" disable folding in markdown mode
let g:vim_markdown_folding_disabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
  autocmd FileType python,go set sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  " Don't syntax highlight markdown because it's often wrong
  autocmd! FileType mkd setlocal syn=off

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()

  " *.md is markdown
  autocmd! BufNewFile,BufRead *.md setlocal ft=
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>

" Switch between buffer
map <leader>b :bn<cr>
map <leader>B :bp<cr>

" Copy-paste to-from system clipboard (+ variant)
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <expr> %% expand('%:h').'/'
map <leader>e :edit %%
map <leader>v :view %%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Selecta Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
    " Escape spaces in the file name. That ensures that it's a single argument
    " when concatenated with vim_command and run with exec.
    let selection = substitute(selection, ' ', '\\ ', "g")
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

function! SelectaFile(path, glob)
  call SelectaCommand("find " . a:path . "/* -type f -and -iname '" . a:glob . "' -and -not -iname '*.pyc'", "", ":e")
endfunction

nnoremap <leader>f :call SelectaFile(".", "*")<cr>
nnoremap <leader>rv :call SelectaFile("app/views", "*")<cr>
nnoremap <leader>rc :call SelectaFile("app/controllers", "*")<cr>
nnoremap <leader>rm :call SelectaFile("app/models", "*")<cr>
nnoremap <leader>rh :call SelectaFile("app/helpers", "*")<cr>
nnoremap <leader>rl :call SelectaFile("lib", "*")<cr>
nnoremap <leader>rp :call SelectaFile("public", "*")<cr>
nnoremap <leader>ra :call SelectaFile("app/assets", "*")<cr>
nnoremap <leader>rs :call SelectaFile("app/services", "*")<cr>
nnoremap <leader>rj :call SelectaFile("app/javascript", "*")<cr>

"Fuzzy select
function! SelectaIdentifier()
  " Yank the word under the cursor into the z register
  normal "zyiw
  " Fuzzy match files in the current directory, starting with the word under
  " the cursor
  call SelectaCommand("find * -type f", "-s " . @z, ":e")
endfunction
nnoremap <c-g> :call SelectaIdentifier()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tmux will only forward escape sequences to the terminal if surrounded by a
" DCS sequence

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
