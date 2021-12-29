set scrolloff=8
set number
set relativenumber
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set encoding=UTF-8
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set colorcolumn=80
highlight ColorColumn guibg=white

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" set filetypes as typescriptreact
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

call plug#begin('~/.vim/plugged')

" themes
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'

" javascript/typescript/react
" Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'jparise/vim-graphql'
" Plug 'leafgarland/typescript-vim'
" Plug 'yuezk/vim-js'
" Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'sheerun/vim-polyglot'

" nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" telescope
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-graphql',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-html-css-support',
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-graphql',
  \ 'coc-solargraph',
  \ ]

" everything else
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'

call plug#end()

set termguicolors     " enable true colors support
let ayucolor="dark"
syntax on
colorscheme gruvbox
set background=dark

let mapleader = " "

nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>gf :Telescope git_files<CR>
nnoremap <leader>lg :Telescope live_grep<CR>
" Symbol renaming.
nnoremap <leader>rn <Plug>(coc-rename)
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-e> :NERDTree<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

tnoremap <esc> <C-\><C-n>

lua << EOF
require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "coverage"
    }
  }
}
EOF
