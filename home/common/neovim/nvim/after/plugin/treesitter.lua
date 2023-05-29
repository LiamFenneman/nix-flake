require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'cpp', 'zig', 'rust', 'toml', 'lua', 'java', 'typescript', 'help', 'wgsl' },
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})
