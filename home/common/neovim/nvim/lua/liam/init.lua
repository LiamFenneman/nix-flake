require('liam.packer')
require('liam.set')
require('liam.keymap')
require('liam.commands')

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

vim.filetype.add({ extension = { wgsl = 'wgsl' } })
