" .vimrc file, after saving the file,
" :PlugInstall
" :PluginInstall

" vim-plug {{{
call plug#begin('~/.vim/bundle')
Plug 'skywind3000/vim-terminal-help'
" Vim for markdown, text etc
Plug 'reedes/vim-pencil'
Plug 'gabrielelana/vim-markdown'
" Graphviz Plugin
Plug 'liuchengxu/graphviz.vim',{'for':'dot'}
" Surround with anything
Plug 'tpope/vim-surround'
" View git commits of lines under the cursor
Plug 'rhysd/git-messenger.vim'

" Align text block with gl<Character>
Plug 'tommcdo/vim-lion'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Colors
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'nightsense/snow'
Plug 'arcticicestudio/nord-vim'
Plug 'nightsense/cosmic_latte'
Plug 'junegunn/seoul256.vim'
Plug 'sainnhe/sonokai'
Plug 'tomasiser/vim-code-dark'
Plug 'whatyouhide/vim-gotham'

" Shows colors like -> #071F
Plug '~/.vim/bundle/colorizer'

" Complete the brackets and string quotations automatically,
Plug 'jiangmiao/auto-pairs'

" For snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Distraction free typing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Latex Live Preview

Plug 'xuhdev/vim-latex-live-preview'

"Nerd Tree for VScode like File Tree

Plug 'preservim/nerdtree'

" File icons for NERDTree
Plug 'ryanoasis/vim-devicons'

Plug 'vim-scripts/AutoComplPop'

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Airline Integration and Tmux
Plug 'edkolev/tmuxline.vim'

" Comment/Uncomment
Plug 'tpope/vim-commentary'

" Git Support
Plug 'tpope/vim-fugitive'
"Vim Git Plugin
Plug 'jreybert/vimagit'

"Python Black for autoformat python code
Plug 'psf/black', { 'branch': 'stable'  }

" Auto Correct like smartphone keyboards
" Plug '~/.vim/bundle/vim-you-autocorrect', {'for': ['markdown','text','tex']}
"
" ALE for syntax checking
"
Plug 'dense-analysis/ale'

"TOML File type

Plug 'cespare/vim-toml', { 'branch': 'main' }
"Highlight yank
Plug 'machakann/vim-highlightedyank'
call plug#end()
" end vim plug }}}

" Vundle {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Valloric/YouCompleteMe'


call vundle#end()

" end Vundle }}}

" Basic Settings {{{
syntax on

set encoding=UTF-8
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set spell
set spelllang=en_us
set nu
set smartcase
set splitbelow splitright
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set autoread
set colorcolumn=80
set scrolloff=8
highlight ColorColumn ctermbg=0 guibg=lightgrey

set mouse=a

set complete+=kspell
set completeopt=menuone,longest

set rtp+=~/.fzf
set textwidth=80
set relativenumber
set number
set ruler
set showcmd
set nowrap
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*/node_modules/*
set wildmenu
set autoread
set autowrite
set incsearch ignorecase smartcase hlsearch
set pastetoggle=<F10>
set fillchars=vert:\|
set noexpandtab
set background=dark
set pumheight=5

" fix meta-keys which generate <Esc>a .. <Esc>z
if !has('nvim')
	let c='a'
	while c <= 'z'
		exec "set <M-".c.">=\e".c
		exec "imap \e".c." <M-".c.">"
		let c = nr2char(1+char2nr(c))
	endw
endif

packadd! dracula
syntax enable

let g:dracula_colorterm=0
" colorscheme dracula
let g:dracula_italic = 0


" End Basic Settings }}}


" Custom mappings {{{
"
let mapleader = "," " map leader to comma


" Turn off highlight
noremap  <Leader>hl :set nohls<CR>
" Match Brackets using Tab
" noremap  <TAB> %
" Necessity
inoremap <Leader><Leader> <Esc>
vnoremap <Leader><Leader> <Esc>gV
nnoremap <Leader><Leader> <Esc>
" This is a lifesaver so that you could move right and left in insert mode

inoremap <Leader>l <Esc>la
inoremap <Leader>h <Esc>ha

" Move around Buffer
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <Space> :bnext<CR>
nnoremap <BS> :bprevious<CR>
nnoremap <Del> :bdelete<CR>
" Map autocompletion
inoremap <M-n> <C-x><C-n>
inoremap <A-n> <C-x><C-n>
inoremap <M-l> <C-x><C-l>
inoremap <A-l> <C-x><C-l>
inoremap <M-o> <C-x><C-o>
inoremap <A-o> <C-x><C-o>
" write file with sudo
cmap w!! w !sudo tee % >/dev/null

" TMux
"

function! TmuxMove(direction)
	        let wnr = winnr()
			silent! execute 'wincmd ' . a:direction
			" If the winnr is still the same after we moved, it
			" is the last pane
			if wnr == winnr()
				call system('tmux select-pane -' . tr(a:direction, 'phjkl','lLDUR'))
			end
endfunction

" nnoremap <silent> <C-Left> :call TmuxMove('h')<cr>
" nnoremap <silent> <C-Down> :call TmuxMove('j')<cr>
" nnoremap <silent> <C-Up> :call TmuxMove('k')<cr>
" nnoremap <silent> <C-Right> :call TmuxMove('l')<cr>

nnoremap <silent> <C-h> :call TmuxMove('h')<cr>
nnoremap <silent> <C-j> :call TmuxMove('j')<cr>
nnoremap <silent> <C-k> :call TmuxMove('k')<cr>
nnoremap <silent> <C-l> :call TmuxMove('l')<cr>

" The lifeblood of a programmer -  Copy Paste

vnoremap <C-c> "+y

" change the current under cursor word to something else with cn or cN
" You can then hit '.' to repeat the action and change every occurance of that
" word

nnoremap cn *``cgn
nnoremap cN *``cgN

" Keep it Centered when you search

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

"Open a terminal
nnoremap <Leader>t :ter<CR>

"You Complete Me autocompletion commands
"
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter RefactorRename

" In visual mode press j and k to move blocks of lines down and up
"
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Nerd Tree Specific
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree. If a file is specified, move the cursor to its window.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


let g:powerline_pycmd="py3"
:set laststatus=2

" Shift daalke : teepne se accha hai ; maaro
nnoremap ; :
vnoremap ; :

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set t_Co=256

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" End Custom mappings}}}

" Filetype Settings {{{
"
" Ruby
autocmd FileType ruby set ts=2 sw=2

" HTML
autocmd FileType html set ts=2 sw=4

" Porth Support
autocmd BufRead,BufNewFile *.porth set filetype=porth


"LaTex
let g:tex_conceal="ads"
let g:tex_flavor='latex'
let g:Tex_CompileRule_pdf = 'pdflatex --synctex=-1 -src-specials -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'

autocmd FileType tex nnoremap <Leader>lm :!pdflatex %<CR><CR>
autocmd FileType tex nnoremap <Leader>ll :!latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" <CR><CR>
autocmd FileType tex nnoremap <Leader>lc :!latexmk -c<CR><CR>
autocmd FileType tex nnoremap <Leader>bb :!bibtex %:r<CR><CR>
autocmd FileType tex nnoremap <Leader>p :LLPStartPreview<CR>


augroup debianlatexfix
" Remove all vimrc autocommands within scope
autocmd!
autocmd BufNewFile,BufRead *.tex   set syntax=tex
autocmd BufNewFile,BufRead *.cls   set syntax=tex
augroup END


"CPP
let $CXX='g++'
let $CXXFLAGS='-Wall -Werror -g'
autocmd FileType cpp nnoremap <Leader>ll :make %<<CR>

"C
let $CFLAGS='-Wall -Werror -g'
autocmd FileType c nnoremap <Leader>ll :make %<<CR>
autocmd FileType c nnoremap <Leader>ts :!tmux send-keys -t 1 "cc " % Enter<CR>
autocmd FileType c nnoremap <Leader>lm :make <CR>
autocmd FileType c set ts=4 sw=4

"Python
autocmd FileType python nnoremap <Leader>ll :!python3 %<CR>
autocmd FileType python nnoremap <F5> :!python3 %<CR>
autocmd FileType python nnoremap <Leader>lr :Black<CR>

"Rust
autocmd FileType rust nnoremap <Leader>ll :!cargo run<CR>

" Cython Support
augroup pyx_ft
au!
autocmd BufNewFile,BufRead *.pyx set filetype=python
augroup END

packloadall
silent! helptags ALL

" Saves vim folds automatically and then restores them when you open the file
" again
augroup remember_folds
  autocmd!
	au BufWinLeave ?* mkview 1
	au BufWinEnter ?* silent! loadview 1
augroup END

" End Filetype settings }}}

" Plugin Settings {{{
"
"Goyo and Limelight
"color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient = 0.7
let g:limelight_paragraph_span = 1


"Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsExpandTrigger="<S-tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" Coc.nvim
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" FZF
let g:fzf_colors =
\ { 'fg':    ['fg', 'Normal'],
\ 'bg':      ['bg', 'Normal'],
\ 'hl':      ['fg', 'Comment'],
\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+':     ['fg', 'Statement'],
\ 'info':    ['fg', 'PreProc'],
\ 'border':  ['fg', 'Ignore'],
\ 'prompt':  ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker':  ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header':  ['fg', 'Comment'] }
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fb :Buffers<CR>


" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''


" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Switch to your current theme

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode



" End Plugin Settings }}}



let g:sonokai_style = 'default'
if exists('$TMUX')
let g:sonokai_enable_italic = 0
let g:sonokai_disable_italic_comment = 1
else
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
endif


colorscheme sonokai

let g:airline_theme = 'onedark'

" Edit the Latex reference file
nmap <silent> <leader>el :e ~/work/uni.bib<CR>

" Latex shortcuts that are copied from Luke Smith {{{

"Navigating with guides
inoremap <Leader><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Leader><Tab> <Esc>/<++><Enter>"_c4l
nnoremap <Leader><Tab> /<++><Enter>"_c4l
inoremap ;gui <++>


autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
" autocmd FileType tex inoremap ;fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
" autocmd FileType tex inoremap ;exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ;bf \textbf{}<++><Esc>T{i
autocmd FileType tex vnoremap ; <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
autocmd FileType tex vnoremap : <ESC>`<i{\<ESC>`>2la}<ESC>?{\\<Enter>la
autocmd FileType tex inoremap {{ <Esc>F{i
autocmd FileType tex inoremap }} <Esc>f}a
autocmd FileType tex inoremap ;it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ;ct \cite{}<++><Esc>T{i
autocmd FileType tex inoremap ;cp \parencite{}<++><Esc>T{i
" autocmd FileType tex inoremap ;glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
" autocmd FileType tex inoremap ;x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ;al \begin{align}<Enter><Enter>\end{align}<Enter><Enter><++><Esc>3kA<Tab>
autocmd FileType tex inoremap ;eq \begin{equation}<Enter><Enter>\end{equation}<Enter><Enter><++><Esc>3kA<Tab>
autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;li <Enter>\item<Space>
autocmd FileType tex inoremap ;ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
" autocmd FileType tex inoremap ;ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
" autocmd FileType tex inoremap ;can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;con \const{}<Tab><++><Esc>T{i
" autocmd FileType tex inoremap ;v \vio{}<Tab><++><Esc>T{i
" autocmd FileType tex inoremap ;a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap ;sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
" autocmd FileType tex inoremap ;st <Esc>F{i*<Esc>f}i
"autocmd FileType tex inoremap ;up \usepackage{}<Esc>i
"autocmd FileType tex inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
"autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
"autocmd FileType tex inoremap ;tt \texttt{}<Space><++><Esc>T{i
"autocmd FileType tex inoremap ;bt {\blindtext}
"autocmd FileType tex inoremap ;nu $\varnothing$
"autocmd FileType tex inoremap ;col
"\begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
"autocmd FileType tex inoremap ;rn (\ref{})<++><Esc>F}i
""""EN







""".bib
autocmd FileType bib inoremap ;a @article{<Enter>author<Space>=<Space>"<++>",<Enter>year<Space>=<Space>"<++>",<Enter>title<Space>=<Space>"<++>",<Enter>journal<Space>=<Space>"<++>",<Enter>volume<Space>=<Space>"<++>",<Enter>pages<Space>=<Space>"<++>",<Enter>}<Enter><++><Esc>8kA,<Esc>i
autocmd FileType bib inoremap ;b @book{<Enter>author<Space>=<Space>"<++>",<Enter>year<Space>=<Space>"<++>",<Enter>title<Space>=<Space>"<++>",<Enter>publisher<Space>=<Space>"<++>",<Enter>}<Enter><++><Esc>6kA,<Esc>i
autocmd FileType bib inoremap ;c @incollection{<Enter>author<Space>=<Space>"<++>",<Enter>title<Space>=<Space>"<++>",<Enter>booktitle<Space>=<Space>"<++>",<Enter>editor<Space>=<Space>"<++>",<Enter>year<Space>=<Space>"<++>",<Enter>publisher<Space>=<Space>"<++>",<Enter>}<Enter><++><Esc>8kA,<Esc>i








" End Luke smith Latex shortcuts}}}

" ALE Settings{{{
"
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'rust': ['rustfmt'],
\   'python': ['isort','black','reorder-python-imports'],
\	'tex': ['latexindent','textlint'],
\}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
"
" }}}



" Open Config Files {{{
"
" Edit the .bashrc"
nmap <silent> <leader>eb :e ~/.bashrc<CR>
" Edit the .vimrc"
nmap <silent> <leader>ev :e ~/.vimrc<CR>
" Edit the .gitconfig"
nmap <silent> <leader>eg :e ~/.gitconfig<CR>
" Edit the .tmux.conf"
nmap <silent> <leader>et :e ~/.tmux.conf<CR>
" Open a scratch file
nmap <silent> <leader>eh :e ~/scratch.txt<CR>
" }}}
