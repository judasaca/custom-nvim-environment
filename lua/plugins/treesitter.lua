return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {"lua", "javascript", "diff", "css", "dockerfile", "gitignore", "rust", "json", "prisma", "python", "html", "typescript"},
      highlight = { enable = true },
      indent = { enable = true },  
    })
  end
}
