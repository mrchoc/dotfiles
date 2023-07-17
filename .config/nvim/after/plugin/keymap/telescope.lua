local opts = {noremap = true, silent = true};
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-f>', builtin.find_files, opts)
vim.keymap.set('n', '<C-g>', builtin.live_grep, opts)
vim.keymap.set('n', '<C-b>', builtin.buffers, opts)
vim.keymap.set('n', '<C-s>', builtin.git_status, opts)
vim.keymap.set('n', '<C-p>', builtin.git_files, opts)

