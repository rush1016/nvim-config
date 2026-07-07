vim.g.mapleader = " "
vim.g.editorconfig = false

vim.opt.guicursor = ""
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- vim.opt.rnu = true
-- vim.opt.nu = true

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
vim.opt.splitbelow = true

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

local original_get_option = vim.filetype.get_option
vim.filetype.get_option = function(filetype, option)
  -- Only intercept commentstring requests on Vue buffers
  if option == "commentstring" and vim.bo.filetype == "vue" then
    local cursor_row = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_get_lines(0, 0, cursor_row, false)
    
    -- Scan backwards from the cursor to see what block tag we are inside
    for i = #lines, 1, -1 do
      local line = lines[i]
      if line:match("<script") then
        return "// %s"
      elseif line:match("<style") then
        return "/* %s */"
      elseif line:match("<template") then
        return "<!-- %s -->"
      end
    end
    -- Default fallback if outside structural elements
    return "<!-- %s -->"
  end

  return original_get_option(filetype, option)
end
