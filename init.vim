set scrolloff=8
set number
set relativenumber
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'

" javascript/typescript/react
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'MaxMEllon/vim-jsx-pretty'

" nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" telescope
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

call plug#end()

set termguicolors     " enable true colors support
let ayucolor="mirage"
colorscheme gruvbox

let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>gf :Telescope git_files<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-e> :NERDTree<CR>
inoremap jk <esc>
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
