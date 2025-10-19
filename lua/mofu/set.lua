vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 8
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false

vim.o.smartindent = true
vim.o.wrap = false

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = vim.fn.stdpath 'data' .. '\\undodir'
vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

vim.o.termguicolors = true

vim.o.scrolloff = 8
vim.o.cursorline = true
vim.o.signcolumn = 'yes'

vim.o.updatetime = 50

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.confirm = true

--[[vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.opt.foldcolumn = '0'
vim.opt.foldtext = ''--]]
