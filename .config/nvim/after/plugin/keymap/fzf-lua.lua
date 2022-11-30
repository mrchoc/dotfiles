local opts = {noremap = true, silent = true};
vim.api.nvim_set_keymap('n', '<C-f>', "<cmd>lua require('fzf-lua').files({ cmd = 'fd --hidden --no-ignore' })<cr>", opts)
vim.api.nvim_set_keymap('n', '<C-b>', "<cmd>lua require('fzf-lua').buffers()<cr>", opts)
vim.api.nvim_set_keymap('n', '<C-p>', "<cmd>lua require('fzf-lua').git_files()<cr>", opts)
vim.api.nvim_set_keymap('n', '<C-s>', "<cmd>lua require('fzf-lua').git_status()<cr>", opts)
vim.api.nvim_set_keymap('n', '<C-g>', "<cmd>lua require('fzf-lua').grep_project()<cr>", opts)
