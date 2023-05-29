local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.sqlfluff.with({
            extra_args = { "--dialect", "postgres" },
        }),
    },
})
