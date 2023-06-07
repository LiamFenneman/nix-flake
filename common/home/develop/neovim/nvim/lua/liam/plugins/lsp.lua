return {
    {
        'folke/neodev.nvim',
        opts = {},
        priority = 950,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        priority = 900,
        opts = {},
        build = ':MasonUpdate',
    },
    {
        'williamboman/mason-lspconfig.nvim',
        lazy = false,
        priority = 900,
        opts = {},
    },
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        priority = 900,
        dependencies = { 'hrsh7th/cmp-nvim-lsp' },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require('lspconfig')

            -- Lua
            lspconfig.lua_ls.setup {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        },
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    }
                }
            }

            -- Rust
            lspconfig.rust_analyzer.setup {
                capabilities = capabilities,
                settings = {
                    ['rust-analyzer'] = {
                        check = {
                            command = 'clippy'
                        },
                    },
                },
            }

            -- Typescript
            lspconfig.tsserver.setup {
                capabilities = capabilities,
            }

            -- Zig
            lspconfig.zls.setup {
                capabilities = capabilities,
            }

            -- OCaml
            lspconfig.ocamllsp.setup {
                capabilities = capabilities,
            }

            -- LaTeX
            local path = vim.fn.stdpath('config') .. '/spell/en.utf-8.add'
            local words = {}
            for word in io.open(path, 'r'):lines() do table.insert(words, word) end
            lspconfig.ltex.setup {
                capabilities = capabilities,
                settings = {
                    ltex = {
                        language = "en-NZ",
                        dictionary = {
                            ['en-NZ'] = words,
                        },
                        additionalRules = {
                            languageModel = '~/.local/share/ltex-ls/ngrams-en/',
                        },
                    },
                },
            }

            -- Nix
            lspconfig.nil_ls.setup {
                capabilities = capabilities,
                settings = {
                    ['nil'] = {
                        formattings = {
                            command = { 'nixpkgs-fmt' },
                        },
                    },
                },
            }

            local function gmap(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end
                vim.keymap.set('n', keys, func, { desc = desc })
            end

            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            gmap('gl', vim.diagnostic.open_float, 'Open Float')
            gmap('[d', vim.diagnostic.goto_prev, 'Goto Prev')
            gmap(']d', vim.diagnostic.goto_next, 'Goto Next')

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local function map(mode, keys, func, desc)
                        if desc then
                            desc = 'LSP: ' .. desc
                        end
                        vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = desc })
                    end

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    map('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                    map('n', 'gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
                    map('n', 'K', vim.lsp.buf.hover, 'Hover')
                    map('n', 'gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
                    map('n', '<C-k>', vim.lsp.buf.signature_help, 'Signature Help')
                    map('n', '<leader>D', vim.lsp.buf.type_definition, 'Goto Type [D]efinition')
                    map('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                    map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
                    map('n', 'gr', vim.lsp.buf.references, '[G]oto [R]eferences')
                    map('n', '<leader>f', function()
                        vim.lsp.buf.format { async = true }
                    end, '[F]ormat')

                    map('n', '<leader>lr', ':LspRestart<CR>', '[R]estart')
                    map('n', '<leader>li', ':LspInfo<CR>', '[I]nfo')
                end,
            })
        end
    },
}