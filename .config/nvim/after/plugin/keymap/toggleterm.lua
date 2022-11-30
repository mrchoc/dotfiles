vim.api.nvim_set_keymap('n', '<c-a>', ":ToggleTermToggleAll<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<c-a>', "<Esc><cmd>ToggleTermToggleAll<cr>", {noremap = true, silent = true})
