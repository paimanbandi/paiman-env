" vim-plug
call plug#begin('/root/.local/share/nvim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Chiel92/vim-autoformat'
Plug 'ekalinin/Dockerfile.vim'

call plug#end()

set relativenumber
set number
set ruler
set mouse=a
set tabstop=4 softtabstop=0 shiftwidth=4
set noswapfile

filetype plugin on
syntax on

if $TERM_PROGRAM =~ "iTerm"
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" gruvbox
colorscheme gruvbox

" nerdtree
autocmd BufWinEnter * NERDTreeFind

let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" fzf & rg
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-r> :Rg<CR>

" js family
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" coc
nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"autoformat
au BufWrite * :Autoformat
