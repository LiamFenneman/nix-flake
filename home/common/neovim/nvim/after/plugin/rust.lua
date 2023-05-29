local crates = require('crates')
crates.setup()
local function map(mode, l, r, desc)
    desc = '[C]rates: ' .. desc
    local opts = {
        noremap = true,
        silent = true,
        desc = desc,
    }
    vim.keymap.set(mode, l, r, opts)
end

map('n', '<leader>ct', crates.toggle, '[T]oggle hints')
map('n', '<leader>cr', crates.reload, '[R]eload')

map('n', '<leader>cv', crates.show_versions_popup, '[V]ersion popup')
map('n', '<leader>cf', crates.show_features_popup, '[F]eatures popup')
map('n', '<leader>cd', crates.show_dependencies_popup, '[D]epenencies popup')

map('n', '<leader>cH', crates.open_homepage, 'Open [H]omepage')
map('n', '<leader>cR', crates.open_repository, 'Open [R]epository')
map('n', '<leader>cD', crates.open_documentation, 'Open [D]ocumentation')
map('n', '<leader>cC', crates.open_crates_io, 'Open [C]rates.io')
