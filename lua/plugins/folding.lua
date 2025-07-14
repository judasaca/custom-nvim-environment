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
		end,
	},
}
