return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "lua",
        "javascript",
        "diff",
        "css",
        "dockerfile",
        "gitignore",
        "rust",
        "json",
        "prisma",
        "python",
        "html",
        "typescript",
        "regex",
        "markdown",
        "markdown_inline",
        "vim",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
