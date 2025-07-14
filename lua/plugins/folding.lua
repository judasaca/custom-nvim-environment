return {
	{
		"kevinhwang91/promise-async",
		lazy = true, -- It will be loaded only when required
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			require("ufo").setup({
				provider_selector = function()
					return { "lsp", "indent" }
				end,
			})
			vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "close fold" })
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "close fold" })
		end,
	},
}
