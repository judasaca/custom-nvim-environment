local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.opt.termguicolors = true
vim.opt.foldenable = true
vim.opt.foldlevelstart = 99
vim.o.exrc = true -- load .nvim.lua from cwd
vim.o.secure = true -- but sandbox it (no autocmds, shell commands, etc.)
--vim.opt.foldcolumn = "1"
local opts = {}
require("vim-options")
require("lazy").setup("plugins")
