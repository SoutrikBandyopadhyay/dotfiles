" .vimrc file, after saving the file,
" :PlugInstall
" :PluginInstall

" vim-plug {{{
call plug#begin('~/.vim/bundle')
Plug 'skywind3000/vim-terminal-help'
" Vim for markdown, text etc
Plug 'reedes/vim-pencil'
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


" Auto Correct like smartphone keyboards
" Plug '~/.vim/bundle/vim-you-autocorrect', {'for': ['markdown','text','tex']}

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

" let g:dracula_colorterm=0
" colorscheme dracula
" let g:dracula_italic = 0

" 'morhetz/gruvbox'
" 'w0ng/vim-hybrid'
" 'nightsense/snow'
" 'arcticicestudio/nord-vim'
" 'nightsense/cosmic_latte'
" 'junegunn/seoul256.vim'
" 'sainnhe/sonokai'

colorscheme gruvbox
" End Basic Settings }}}

" Custom mappings {{{
"
let mapleader = "," " map leader to comma


" Turn off highlight
noremap  <Leader>hl :set nohls<CR>
" Match Brackets using Tab
noremap  <TAB> %
" Necessity
inoremap <Leader><Leader> <Esc>
vnoremap <Leader><Leader> <Esc>gV
nnoremap <Leader><Leader> <Esc>
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
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

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
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

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
let g:airline_theme = 'onedark'

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode



" End Plugin Settings }}}

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
