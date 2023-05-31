-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Copy/Paste
vim.o.clipboard = 'unnamedplus'

-- Disable highlight on search
vim.o.hlsearch = false

-- Disable the swapfile / backup of files in buffers
vim.o.swapfile = false
vim.o.backup = false

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- Misc.
vim.o.guicursor = ''
vim.o.wrap = false
vim.o.colorcolumn = '120'
vim.o.scrolloff = 8
vim.o.errorbells = false

-- Give more space for displaying messages.
vim.o.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.o.updatetime = 50
vim.o.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Colorscheme
vim.o.termguicolors = true
vim.o.background = 'dark'

-- Folding
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldenable = false

-- Text Width
vim.o.textwidth = 110
