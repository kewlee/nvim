vim.o.completeopt = "menu,menuone,noinsert"
vim.o.fixeol = false
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.laststatus = 3
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.writebackup = false

vim.opt.fillchars = {
    eob = " ",
}

vim.opt.shortmess:append("c")
