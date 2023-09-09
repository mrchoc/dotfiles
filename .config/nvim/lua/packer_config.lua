vim.cmd [[packadd packer.nvim]]

require('nvim-treesitter.configs').setup {
  ensure_installed = {'javascript', 'typescript', 'tsx', 'python', 'go', 'c', 'dart', 'lua', 'html', 'css', 'prisma', 'java', 'rust', 'toml', 'markdown', 'markdown_inline'},
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

require('toggleterm').setup {
  open_mapping = [[<c-t>]],
  insert_mappings = true,
  terminal_mappings = true,
  float_opts = {
    width = function()
      return math.floor(vim.o.columns * 0.8)
    end,
    height = function()
      return math.floor(vim.o.lines * 0.85)
    end,
    border = "curved"
  },
}

require('dressing').setup {
  select = {
    backend = {"builtin"}
  }
}

require('telescope').setup {
  pickers = {
    find_files = {
      hidden = true
    }
  }
}

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use { 'dracula/vim', as = 'dracula' }
  use 'ryanoasis/vim-devicons'
  use 'lukas-reineke/indent-blankline.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-lua/plenary.nvim'
  use 'jiangmiao/auto-pairs'
  use 'lewis6991/gitsigns.nvim'
  use { "akinsho/toggleterm.nvim", tag = '*' }
  use 'mfussenegger/nvim-jdtls'
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }
  use {'jose-elias-alvarez/null-ls.nvim'}
  use {'MunifTanjim/prettier.nvim'}
  use {'stevearc/dressing.nvim'}
  use {'nvim-telescope/telescope.nvim', branch = '0.1.x'}
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
end)
