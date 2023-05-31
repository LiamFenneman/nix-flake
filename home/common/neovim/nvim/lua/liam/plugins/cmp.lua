return {
    'hrsh7th/nvim-cmp',
    lazy = false,
    priority = 800,
    dependencies = {
        -- Sources
        'hrsh7th/cmp-buffer',
        -- 'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-nvim-lua',
        -- 'hrsh7th/cmp-path',
        'petertriho/cmp-git',

        -- Icons
        'onsails/lspkind.nvim',

        -- Snippets
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',

        -- Copilot
        'zbirenbaum/copilot.lua',
        'zbirenbaum/copilot-cmp',
    },
    config = function()
        local cmp = require('cmp')
        local lspkind = require('lspkind')
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol_text',
                    maxwidth = 50,
                    symbol_map = { Copilot = '' },
                    menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",
                    })
                }),
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
            },
            sources = {
                { name = 'copilot' },
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'nvim_lsp_signature_help' },
                { name = 'luasnip' },
                { name = 'buffer',                 keyword_length = 4 },
            },
        })
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'git' },
            })
        })
        cmp.setup.filetype('lua', {
            sources = cmp.config.sources({
                { name = 'nvim_lua' },
            })
        })

        require('copilot').setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
        })
        require('copilot_cmp').setup({ opts = { event = nil } })
    end
}
