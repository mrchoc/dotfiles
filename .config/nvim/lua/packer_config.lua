vim.cmd [[packadd packer.nvim]]

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'javascript',
    'typescript',
    'tsx',
    'python',
    'go',
    'c',
    'dart',
    'lua',
    'html',
    'css',
    'prisma',
    'java',
    'rust',
    'toml',
    'markdown', 'markdown_inline',
    'vimdoc',
    'terraform',
    'yaml'
  },
  sync_install = true,
  highlight = {
    enable = true,
    disable = {
      "txt"
    }
  },
}

vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("ibl").setup {
  indent = {
    char = "▏"
  }
}

require('gitsigns').setup {
  current_line_blame_opts = {
    delay = 0,
  },
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk)
    map('n', '<leader>hr', gitsigns.reset_hunk)
    map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hu', gitsigns.undo_stage_hunk)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>hd', gitsigns.diffthis)
    map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
    map('n', '<leader>td', gitsigns.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
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

require('lualine').setup {
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}

require("cheatsheet").setup({
  bundled_cheatsheets = {
    enabled = { "tmux" },
  },
  bundled_plugin_cheatsheets = {
    enabled = { "gitsigns.nvim" },
  }
})

require('cloak').setup({
  enabled = false,
})

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
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
      {'williamboman/mason.nvim', run = ':MasonUpdate'},
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }
  use {'nvimtools/none-ls.nvim', commit = 'cc0a3c45047e3daf85d07c1571d65476cfce6480'}
  use {'MunifTanjim/prettier.nvim'}
  use {'stevearc/dressing.nvim'}
  use {'nvim-telescope/telescope.nvim', branch = '0.1.x'}
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use {
    'sudormrfbin/cheatsheet.nvim',

    requires = {
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    }
  }
  use 'laytan/cloak.nvim'
  use({
    "robitx/gp.nvim",
    config = function()
      local conf = {
        providers = {
          copilot = {
            endpoint = "https://api.githubcopilot.com/chat/completions",
            secret = {
              "bash",
              "-c",
              "cat ~/.config/github-copilot/apps.json | sed -e 's/.*oauth_token...//;s/\".*//'",
            },
          },
        }
      }
      require("gp").setup(conf)
    end,
  })
end)
