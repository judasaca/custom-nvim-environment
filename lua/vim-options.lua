vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set cursorline")

vim.g.mapleader = " "

vim.keymap.set("n", "<c-k>", ":windcmd k<CR>")
vim.keymap.set("n", "<c-j>", ":windcmd j<CR>")
vim.keymap.set("n", "<c-h>", ":windcmd h<CR>")
vim.keymap.set("n", "<c-l>", ":windcmd l<CR>")

vim.keymap.set("n", "-", "<cmd>foldclose<CR>", { desc = "close fold" })
vim.keymap.set("n", "+", "<cmd>foldopen<CR>", { desc = "open fold" })
vim.keymap.set("n", "zK", function()
	local winId = require("ufo").peekFoldedLinesUnderCursor()
	if not winId then
		vim.lsp.buff.hover()
	end
end)

vim.api.nvim_set_option("clipboard", "unnamed")

vim.keymap.set("n", "<leader>nl", function()
	require("noice").cmd("last")
end)

vim.keymap.set("n", "<leader>nh", function()
	require("noice").cmd("history")
end)

vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })

vim.keymap.set("n", "<leader>crp", function()
	vim.fn.setreg("+", vim.fn.expand("%"))
	print("Copied relative path: " .. vim.fn.expand("%"))
end, { desc = "Copy relative file path" })

vim.keymap.set("n", "<leader>tc", function()
	require("treesitter-context").toggle()
end, { desc = "Toggle Treesitter Context" })

vim.api.nvim_create_user_command("ConformToggle", function()
	if vim.b.conform_disable then
		vim.b.conform_disable = false
		print("Conform: format on save enabled")
	else
		vim.b.conform_disable = true
		print("Conform: format on save disabled")
	end
end, {})
vim.keymap.set("n", "<leader>tf", "<cmd>ConformToggle<CR>", { desc = "Toggle format on save" })
