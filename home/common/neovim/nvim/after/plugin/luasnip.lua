local ls = require('luasnip')

-- Expand the current item or jump to the next item
vim.keymap.set({ 'i', 's' }, '<C-k>', function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { desc = 'Expand snippet or jump' })

-- Move to the previous snippet
vim.keymap.set({ 'i', 's' }, '<C-j>', function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { desc = 'Jump to previous snippet' })
