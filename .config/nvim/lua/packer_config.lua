vim.cmd [[packadd packer.nvim]]

require('nvim-treesitter.configs').setup {
  ensure_installed = {'javascript', 'typescript', 'tsx', 'python', 'go', 'c', 'dart', 'lua', 'html', 'css', 'prisma', 'java'},
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

require('gitsigns').setup {
  current_line_blame_opts = {
    delay = 0,
  },
}

require('fzf-lua').setup {
  fzf_opts = {
    ['--layout'] = 'default'
  }
}

require('toggleterm').setup {
  open_mapping = [[<c-t>]],
  insert_mappings = true,
  terminal_mappings = true,
}

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use { 'dracula/vim', as = 'dracula' }
  use 'ryanoasis/vim-devicons'
  use 'lukas-reineke/indent-blankline.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'junegunn/fzf', run = './install --bin' }
  use { 'prettier/vim-prettier', run = 'npm install --frozen-lockfile --production', ft = {'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'} }
  use 'nvim-lua/plenary.nvim'
  use 'jiangmiao/auto-pairs'
  use 'lewis6991/gitsigns.nvim'
  use { 'neoclide/coc.nvim', branch = 'release' }
  use 'ibhagwan/fzf-lua'
  use {"akinsho/toggleterm.nvim", tag = '*'}
end)

