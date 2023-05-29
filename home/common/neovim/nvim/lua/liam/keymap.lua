vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Keybind to exit to Netrw
vim.keymap.set({ 'n', 'v' }, '<leader>qq', vim.cmd.Ex)

-- Auto center screen when paging up/down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Git keymaps
vim.keymap.set('n', '<leader>gp', ':Git push -u origin HEAD<CR>', { desc = '[G]it [P]ush to HEAD' })
vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', { desc = '[G]it [C]ommit' })

-- Source current file
vim.keymap.set('n', '<leader><leader>x', ':source %<CR>', { desc = '[S]ource current file' })
vim.keymap.set('n', '<leader><leader>r', ':!cargo r<CR>', { desc = 'Cargo [R]un' })

-- Format file
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = '[F]ormat file' })

-- Misc. Tricks
vim.keymap.set('n', 'YY', 'va{Vy', { desc = '[Y]ank between brackets' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })
