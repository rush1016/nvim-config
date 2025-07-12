vim.g.mapleader = " "
vim.g.editorconfig = false

vim.opt.guicursor = ""
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.rnu = true
vim.opt.nu = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.autoread = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.inccommand = "nosplit"
vim.opt.backspace = "indent,eol,start"

vim.opt.termguicolors = true

vim.opt.scrolloff = 6
vim.opt.signcolumn = 'yes:1'
vim.opt.colorcolumn = '100'

vim.opt.updatetime = 50

vim.opt.laststatus = 3
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.fixendofline = false

vim.o.statusline = "%{fnamemodify(bufname('%'), ':.')} %m%r%h%w%=%l,%c %p%%"

vim.api.nvim_set_option('clipboard', 'unnamed')

vim.filetype.add({
    pattern = {
        [".*%.blade%.php"] = "blade",
    }
})

vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"

