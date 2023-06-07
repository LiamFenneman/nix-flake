return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            defaults = {
                mappings = {
                    i = {
                        ['<C-u>'] = false,
                        ['<C-d>'] = false,
                    },
                },
            },
        },
        config = function()
            -- Enable telescope fzf native, if installed
            pcall(require('telescope').load_extension, 'fzf')

            local function map(keys, func, desc)
                if desc then
                    desc = 'Telescope: ' .. desc
                end
                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            -- See `:help telescope.builtin`
            local ts = require('telescope.builtin')
            map('<leader>?', ts.oldfiles, '[?] Find recently opened files')
            map('<leader><space>', ts.buffers, '[ ] Find existing buffers')

            map('<leader>sf', ts.find_files, '[S]earch [F]iles')
            map('<leader>sh', ts.help_tags, '[S]earch [H]elp')
            map('<leader>sw', ts.grep_string, '[S]earch current [W]ord')
            map('<leader>sg', ts.live_grep, '[S]earch by [G]rep')
            map('<leader>sd', ts.diagnostics, '[S]earch [D]iagnostics')
            map('<leader>sk', ts.keymaps, '[S]earch [K]eymaps')

            map('<leader>sc', ts.git_commits, '[S]earch Git [C]ommits')
            map('<leader>sbc', ts.git_bcommits, '[S]earch [B]uffer Git [C]ommits')
            map('<leader>ss', ts.git_status, '[S]earch Git [S]tatus')
        end,
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
}
