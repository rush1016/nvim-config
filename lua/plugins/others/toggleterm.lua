return {
    'akinsho/toggleterm.nvim',
    event = 'ColorScheme',
    config = function()
        local highlights = require('rose-pine.plugins.toggleterm')
        require('toggleterm').setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.25
                end
            end,
            -- size = vim.o.columns * 0.3,
            open_mapping = [[<c-\>]],
            -- highlights = highlights,
            direction = 'float',
            close_on_exit = true,
            float_opts = {
                border = 'curved',
                width = 60,
                height = 60,
                row = 0,
                col = 250,
                winblend = 0,
            },
        })

        local Terminal  = require('toggleterm.terminal').Terminal
        local float_opts = {
            border = 'double',
            width = 180,
            height = 40,
            winblend = 0,
        }

        local lazygit = Terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = 'float',
            float_opts = float_opts
        })

        local function _lazygit_toggle()
            lazygit:toggle()
        end

        local function _search_pr()
            local git = require("custom.git")
            local commit_hash = git.get_commit_hash_for_current_line()

            local gh_pr_term = Terminal:new({
                cmd = string.format("~/.dotfiles/scripts/search-pull-request-by-hash.sh %s", commit_hash),
                direction = "float",
                float_opts = float_opts,
                hidden = true,
            })

            gh_pr_term:toggle()
        end

        local function _git_show()
            local git = require("custom.git")
            local commit_hash = git.get_commit_hash_for_current_line()
            local gh_pr_term = Terminal:new({
                cmd = string.format("git show %s", commit_hash),
                direction = "float",
                float_opts = float_opts,
                hidden = true,
            })

            gh_pr_term:toggle()
        end

        local function _view_line_history()
            local start_line = vim.fn.line("v")
            local line = vim.fn.line(".");

            if not start_line or start_line == 0 then
                start_line = line
            end
            local file = vim.fn.fnameescape(vim.fn.expand('%'))
            local git_cmd = string.format("git log -L %d,%d:%s; echo; echo Press ENTER to exit; read", start_line, line, file)
            local tmux_cmd = string.format("tmux new-window -n changes 'bash -c %q'", git_cmd)

            vim.fn.system(tmux_cmd)
        end

        vim.keymap.set("n", "<leader>gl", _lazygit_toggle, {noremap = true, silent = true, desc = 'LazyGit' })
        vim.keymap.set('n', '<Leader>gp', _search_pr, {noremap = true, silent = true, desc = 'Search PR'})
        vim.keymap.set('n', '<Leader>gs', _git_show, {noremap = true, silent = true, desc = 'Git show'})
        vim.keymap.set('n', '<Leader>gh', _view_line_history, {noremap = true, silent = true, desc = 'Git view change history'})
        vim.keymap.set('v', '<Leader>gh', _view_line_history, {noremap = true, silent = true, desc = 'Git view change history'})
    end
}
