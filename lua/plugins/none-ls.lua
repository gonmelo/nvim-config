return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.isort, -- sort imports in python
        null_ls.builtins.formatting.black, -- python formatter
        null_ls.builtins.diagnostics.pylint, -- python linter
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
