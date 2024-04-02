return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "bashls",
          "cssls",
          "dockerls",
          "docker_compose_language_service",
          "eslint",
          "html",
          --"htmx",
          "jsonls",
          "tsserver",
          "jinja_lsp",
          "markdown_oxide",
          "prismals",
          "pyright",
          "rust_analyzer",
          "sqlls",
          "slint_lsp",
          "somesass_ls",
          "taplo",
          "tailwindcss"
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.pyright.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.lua_ls.setup({})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}

