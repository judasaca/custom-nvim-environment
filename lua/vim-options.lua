vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set cursorline")

vim.g.mapleader = " "

vim.keymap.set("n", "<c-k>", ":windcmd k<CR>")
vim.keymap.set("n", "<c-j>", ":windcmd j<CR>")
vim.keymap.set("n", "<c-h>", ":windcmd h<CR>")
vim.keymap.set("n", "<c-l>", ":windcmd l<CR>")

vim.api.nvim_set_option("clipboard", "unnamed")

vim.keymap.set("n", "<leader>nl", function()
  require("noice").cmd("last")
end)

vim.keymap.set("n", "<leader>nh", function()
  require("noice").cmd("history")
end)

vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })
