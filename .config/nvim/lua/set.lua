vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.mouse = "a"
vim.opt.errorbells = false
vim.opt.scrolloff = 20
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
vim.cmd('set guicursor+=a:-blinkwait75-blinkoff100-blinkon125')

-- 2 space indented filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
    "markdown",
    "javascript",
    "javascriptreact",
    "lua",
    "typescript",
    "typescriptreact"
  },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end
})
