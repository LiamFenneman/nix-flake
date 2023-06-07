return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    init = function()
        pcall(require('nvim-treesitter.install').update { with_sync = true })
        require('nvim-treesitter.configs').setup({
            ensure_installed = { 'c', 'cpp', 'zig', 'rust', 'toml', 'lua', 'java', 'typescript' },
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter-context',
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
}
