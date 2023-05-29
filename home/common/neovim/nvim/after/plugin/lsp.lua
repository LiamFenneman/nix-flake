require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})

local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = { omit = { '<F2>', '<F4>', 'gr' } },
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        }
    }
})

lsp.configure('rust_analyzer', {
    settings = {
        ['rust-analyzer'] = {
            check = {
                command = 'clippy'
            },
        },
    },
})

local path = vim.fn.stdpath('config') .. '/spell/en.utf-8.add'
local words = {}
for word in io.open(path, 'r'):lines() do table.insert(words, word) end

lsp.configure('ltex', {
    settings = {
        ltex = {
            language = 'en-NZ',
            dictionary = {
                ['en-NZ'] = words,
            },
            additionalRules = {
                languageModel = '~/.local/share/ltex-ls/ngrams-en/',
            },
        },
    },
})

lsp.setup_servers({ 'tsserver' })

lsp.on_attach(function(client, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    lsp.default_keymaps({ buffer = bufnr })

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    nmap('<leader>lr', ':LspRestart<CR>', '[L]SP [R]estart')
end)

local cmp = require('cmp')
local lspkind = require('lspkind')
lsp.setup_nvim_cmp({
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            symbol_map = { Copilot = '' },
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
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'copilot' },
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
        { name = 'buffer',                 keyword_length = 5 },
        { name = 'calc' },
        { name = 'crates' },
    },
})

lsp.setup()

require('fidget').setup({
    window = {
        blend = 0,
    },
})
