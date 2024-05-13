vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },
  {
    "mg979/vim-visual-multi",
    lazy = true, -- Set lazy loading to true for this plugin
    config = function()
      -- Your configuration for the plugin goes here
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true


-- Map CTRL + ENTER to insert space below
vim.api.nvim_set_keymap('n', '<A-j>', [[:set paste<CR>m`o<Esc>``:set nopaste<CR>]], { silent = true })

-- Map CTRL + SHIFT + ENTER to insert space above
vim.api.nvim_set_keymap('n', '<A-k>', [[:set paste<CR>m`O<Esc>``:set nopaste<CR>]], { silent = true })
