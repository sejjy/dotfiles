vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.guicursor = ""
vim.opt.winborder = "single"
vim.opt.showmode = false

vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail    = "·", nbsp = "␣" }
vim.opt.fillchars = { eob = " ",  lastline = " " }

vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.wrap = false

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.timeoutlen = 250
vim.opt.updatetime = 250

vim.opt.mousemodel = "extend"
vim.opt.scrolloff = 10

vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.sessionoptions = "buffers,curdir,help,localoptions,options,terminal,winsize"
