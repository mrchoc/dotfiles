let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled = 0
let NERDTreeShowHidden=1
let mapleader=" "
let g:floaterm_keymap_toggle = '<Leader>ft'
let g:coq_settings = { 'auto_start': v:true }

set number
set autoindent
set mouse=a
set noerrorbells
set scrolloff=20
set nowrap
set relativenumber
set nu
set signcolumn=yes
set termguicolors
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd FileType typescript setlocal tabstop=2 shiftwidth=2
set guicursor+=a:-blinkwait75-blinkoff100-blinkon125

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'voldikss/vim-floaterm'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ryanoasis/vim-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'lewis6991/gitsigns.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'

call plug#end()

tnoremap <Esc> <C-\><C-n>
nnoremap <leader>l :noh<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-a> :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4 :lua require("harpoon.ui").nav_file(4)<CR>

colorscheme dracula
hi Normal guibg=none ctermbg=none
hi DraculaDiffDelete guibg=none ctermbg=none

lua <<EOF
require('nvim-treesitter.configs').setup {
    ensure_installed = {'javascript', 'typescript', 'python', 'go', 'c'},
    sync_install = true,
    highlight = { enable = true },
}

vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
require('gitsigns').setup()
EOF
