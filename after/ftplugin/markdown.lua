-- Core Neovim's ftplugin/markdown.lua unconditionally calls
-- vim.treesitter.start(), which crashes on fenced code blocks in this
-- Neovim nightly build (languagetree.lua "attempt to call method 'range'").
-- Stop it here until a newer nightly fixes the injection parser bug.
vim.treesitter.stop()
