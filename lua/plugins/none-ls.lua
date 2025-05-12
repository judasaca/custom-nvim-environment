return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        --require("none-ls.diagnostics.eslint_d"),
        null_ls.builtins.formatting.prettier.with({
          extra_filetypes = { "astro", "svg" },
        }),
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.formatting.prisma_format,
      },
      on_attach = function(client, bufnr)
        -- This function allows safe formatting on save
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end
      end,
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
