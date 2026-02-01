-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "

require('lazy').setup({
  spec = {
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },
    'ryanoasis/vim-devicons',
    'lukas-reineke/indent-blankline.nvim',
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'nvim-lua/plenary.nvim',
    'jiangmiao/auto-pairs',
    {'lewis6991/gitsigns.nvim'},
    'akinsho/toggleterm.nvim',
    'mfussenegger/nvim-jdtls',
    {'L3MON4D3/LuaSnip'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'mason-org/mason.nvim'},
    {'mason-org/mason-lspconfig.nvim'},
    {'nvimtools/none-ls.nvim'},
    {'MunifTanjim/prettier.nvim'},
    {'stevearc/dressing.nvim'},
    {'nvim-telescope/telescope.nvim'},
    {
      'sudormrfbin/cheatsheet.nvim',
      dependencies = {
        {'nvim-telescope/telescope.nvim'},
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
      }
    },
    'laytan/cloak.nvim',
    {
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
    },
    'towolf/vim-helm',
    { "rose-pine/neovim",
      name = "rose-pine"
    },
    {
      "davidmh/mdx.nvim",
      dependencies = {"nvim-treesitter/nvim-treesitter"}
    },
    "gbprod/yanky.nvim",
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    },
  },
  checker = { enabled = true }
})

require("rose-pine").setup({
  variant = "main",
  dim_inactive_windows = true,
})

require("yanky").setup()

require("mason").setup()

require("mason-lspconfig").setup {
  ensure_installed = {
    'lua_ls',
    'ts_ls',
    'rust_analyzer',
    'clangd',
    'gopls',
    'helm_ls',
    'elixirls'
  }
}

require('lualine').setup {
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      {
        'filename',
        path = 2
      }
    },
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        path = 2
      }
    },
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
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

require('dressing').setup {
  select = {
    backend = {"builtin"}
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

    map('v', '<leader>hs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)

    map('v', '<leader>hr', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)

    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hi', gitsigns.preview_hunk_inline)

    map('n', '<leader>hb', function()
      gitsigns.blame_line({ full = true })
    end)

    map('n', '<leader>hd', gitsigns.diffthis)

    map('n', '<leader>hD', function()
      gitsigns.diffthis('~')
    end)

    map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
    map('n', '<leader>hq', gitsigns.setqflist)

    -- Toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>tw', gitsigns.toggle_word_diff)

    -- Text object
    map({'o', 'x'}, 'ih', gitsigns.select_hunk)
  end
}

require("ibl").setup {
  indent = {
    char = "▏"
  }
}

require('telescope').setup {
  pickers = {
    find_files = {
      hidden = true
    },
  },
}

require('toggleterm').setup {
  open_mapping = [[<c-t>]],
  insert_mappings = true,
  terminal_mappings = true,
  float_opts = {
    width = function()
      return math.floor(vim.o.columns * 0.80)
    end,
    height = function()
      return math.floor(vim.o.lines * 0.85)
    end,
    border = "curved"
  },
}

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
    'markdown',
    'markdown_inline',
    'terraform',
    'vimdoc',
    'yaml',
    'bash',
    'vue',
    'elixir'
  },
  sync_install = true,
  highlight = {
    enable = true,
    disable = {
      'vimdoc',
      'txt'
    }
  },
}
