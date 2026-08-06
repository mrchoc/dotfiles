require("config.lazy")
require("set")

vim.opt.list = true
vim.opt.listchars:append("space:⋅")

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
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
  callback = function() vim.treesitter.start() end,
})
