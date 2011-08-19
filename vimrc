" Pathogen plugin
let g:pathogen_disabled = ['php', 'syntastic']
call pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set ttyfast 		" Connexion rapide au terminal : améliore la rapidité d'affichage"
set fileformat=unix
set encoding=utf-8
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugin
filetype plugin on
filetype indent on

syn on
set syntax =on
set t_Co=256 "Use 256 colors in terminal"
colorscheme mycolors

" Set to auto read when a file is changed from the outside
set autoread
" Filetypes (au = autocmd)
au filetype help set nonumber " no line numbers when viewing help
au filetype help nnoremap <buffer><cr> <c-]> " Enter selects subject
au filetype help nnoremap <buffer><bs> <c-T> " Backspace to go back

" automatically give executable permissions if file begins with #! and contains
" '/bin/' in the path
function ChPerms()
  if getline(1) =~ "^#!"
    if getline(1) =~ "/bin/"
      silent !chmod a+x <afile>
    endif
  endif
endfunction
au bufwritepost * call ChPerms()

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set title                      " show title in console title bar
set number                     " show line numbers
set cursorline
set cursorcolumn
set mouse =a

set guioptions+=b              " Add scrollbars
set guioptions-=T              " Remove the Toolbar

                               " Set 7 lines to the curors - when moving vertical..
set so=7
set wildmenu                   " Turn on WiLd menu
set ruler                      " Always show current position
set cmdheight=1                " The commandbar height
set hid                        " Change buffer - without saving

                               " Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase                 " Ignore case when searching
set smartcase
set hlsearch                   " Highlight search things
set incsearch                  " Make search act like search in modern browsers

set nolazyredraw               " Don't redraw while executing macros

set magic                      " Set magic on, for regular expressions

set showmatch                  " Show matching bracets when text indicator is over them
set matchtime=2                " How many tenths of a second to blink
set matchpairs+=<:>            " show matching <> (html mainly) as well

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"Persistent undo
try

  if MySys() == "windows"
    set undodir=C:\Windows\Temp
  else
    set undodir=~/.vim/undo
  endif

  set undofile

catch

endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set nowrap		  " Pas de retour à la ligne sur bord de fenêtre: truc nul en prog"
set nowrapscan


"Voir :h php"
let php_sql_query =1
let php_Baselib=1
let php_htmlInStrings=1
let use_xhtml=1
set runtimepath+=~/.vim/doc/php





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ";"
let g:mapleader = ";"


" set the paste toggle key
set pastetoggle=<F11>

" Y yanks to the end of the line
nmap Y y$
" shortcuts for copying to clipboard
map <leader>y "+y
" copy the current line to the clipboard
map <leader>Y "+yy
"Paste from clipboard
map <leader>p "+gP
"Paste with correct indentation
map <leader>P p=`]
"Cut to clipboard
map <leader>x "+x
" show the registers from things cut/yanked
nmap <leader>r :registers<CR>

" Only For The Brave !!!
"inoremap  <Left>  <NOP>
"inoremap  <Right> <NOP>
"inoremap  <Up>    <NOP>
"inoremap  <Down>  <NOP>
"noremap   <Down>  <NOP>
"noremap   <Left>  <NOP>
"noremap   <Right> <NOP>
"noremap   <Up>    <NOP>
"noremap   <Down>  <NOP>
" Evil mappings for Insert mode:
" Move around in Insert mode
imap <C-Left>   <Home>
imap <C-Right>  <End>
imap <C-Up>     <C-Home>
imap <C-Down>   <C-End>
imap <A-Left>   <S-Left>
imap <A-Right>  <S-Right>
imap <A-Up>     <PageUp>
imap <A-Down>   <PageDown>
"Move around in Normal mode
map <C-Left>    <Home>
map <C-Right>   <End>
map <C-Up>      <C-Home>
map <C-Down>    <C-End>
map <A-Left>    <S-Left>
map <A-Right>   <S-Right>
map <A-Up>      <PageUp>
map <A-Down>    <PageDown>

cmap w!! w !sudo tee %

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" ==================================================
" HTML
" ==================================================
" enable a shortcut for tidy using ~/.tidyrc config
map <Leader>T :!tidy -config ~/.tidyrc<cr><cr>


" ==================================================
" Plugins
" ==================================================
"
"MiniBufExplorer Plugin"
"
" Disable in GUI since we already have a Buffers menu
if has('gui_runnig')
  let loaded_minibufexplorer = 1
else
  "the vim direction keys [hjkl] can be made to move you between windows"
  "let g:miniBufExplMapWindowNavVim = 1
  "arrow keys can be made to do the same thing"
  let g:miniBufExplMapWindowNavArrows = 1
  "Ctrl+Tab & Ctrl+Shift+Tab can be setup to switch through your open windows"
  let g:miniBufExplMapCTabSwitchBufs = 1
  "Ctrl+Tab & Ctrl+Shift+Tab can alternatively be setup to cycle through your modifiable buffers in the current window"
  "let g:miniBufExplModSelTarget = 1
endif

" NERDTree
" http://www.vim.org/scripts/script.php?script_id=1658
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
map <leader>t :NERDTreeToggle<CR>
map <leader>T :NERDTree %<CR>

" JSLint
let JS_CMD = 'js'

" EasyMotion
let g:EasyMotion_leader_key = '<Leader>m'

" delimitMate
"
set backspace=indent,eol,start
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
let delimitMate_balance_matchpairs = 1

" screen.vim
let g:ScreenShellTerminal = 'x-terminal-emulator'

" XML Completion
" http://www.vim.org/scripts/script.php?script_id=301
" close xml/html tags like <div>

" pep8
" http://www.vim.org/scripts/script.php?script_id=2914
" set to <leader>M in the actual plugin

" python folding jpythonfold.vim
" http://www.vim.org/scripts/script.php?script_id=2527
" Setup as ftplugin/python.vim for auto loading

" PyDoc
" http://www.vim.org/scripts/script.php?script_id=910
" Search python docs for the keyword
" <leader>pw - search for docs for what's under cursor
" <leader>pW - search for any docs with this keyword mentioned

" Supertab
" http://www.vim.org/scripts/script.php?script_id=182
" :SuperTabHelp
let g:SuperTabNoCompleteAfter = ['$',':',',',';','\s']
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'


" SnipMate
" http://www.vim.org/scripts/script.php?script_id=2540
" ,, - complete and tab to next section
" ,n - show list of snippets for this filetype

" Surround
" http://www.vim.org/scripts/script.php?script_id=1697
" default shortcuts

" Pylint
" http://www.vim.org/scripts/script.php?script_id=891
" default config for underlines of syntax errors in gvim
