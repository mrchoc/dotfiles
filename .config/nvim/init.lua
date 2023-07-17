require("set")
require("packer_config")
vim.g.mapleader = ' '
vim.api.nvim_set_var('airline#extensions#tabline#enabled', 0)
-- use zathura to open pdf(wip)
-- vim.cmd([[autocmd BufEnter *.pdf call jobstart("zathura %") ]])
