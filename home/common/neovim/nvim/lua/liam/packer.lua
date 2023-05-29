require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Markers
    use {
        -- '~/Documents/Projects/hooks.nvim/',
        'LiamFenneman/hooks.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use {
        'ThePrimeagen/harpoon',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },

            -- Add icons to nvim-cmp
            { 'onsails/lspkind.nvim' },

            -- Useful status updates for LSP
            { 'j-hui/fidget.nvim' },

            -- Neovim LSP
            { 'folke/neodev.nvim' },
        }
    }

    -- Formatter
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Snippets
    use 'L3MON4D3/LuaSnip'

    -- Rust-specific
    use 'simrat39/rust-tools.nvim'
    use 'saecki/crates.nvim'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/nvim-treesitter-context'

    -- Telescope
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

    -- Git related
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'lewis6991/gitsigns.nvim'

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    }

    -- Comment
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Indent Blankline
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('indent_blankline').setup {
                char = '┊',
                show_trailing_blankline_indent = false,
            }
        end
    }

    -- GitHub Copilot
    use 'zbirenbaum/copilot.lua'
    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup({ opts = { event = nil } })
        end
    }

    -- Colorscheme
    use {
        'rose-pine/neovim',
        as = 'rose-pine',
    }

    use 'folke/tokyonight.nvim'
end)
