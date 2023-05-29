local group = vim.api.nvim_create_augroup('Liam', { clear = true })

vim.api.nvim_create_user_command('LatexMake', function()
    vim.api.nvim_create_autocmd('BufWritePost', {
        command = 'silent !make clean all',
        group = group,
        pattern = '*.tex',
    })
end, {})

vim.api.nvim_create_user_command('LatexPdf', function()
    vim.api.nvim_create_autocmd('BufWritePost', {
        command = 'silent !pdflatex %',
        group = group,
        pattern = '*.tex',
    })
end, {})

vim.api.nvim_create_user_command('SpellOn', 'set spell spelllang=en_nz', {})
vim.api.nvim_create_user_command('SpellOff', 'set nospell', {})
