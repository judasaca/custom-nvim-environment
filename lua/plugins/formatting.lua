return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			json = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
		},
		format_on_save = function(bufnr)
			-- Disable with a global or buffer-local variable
			if vim.g.conform_disable or vim.b[bufnr].conform_disable then
				return
			end
			return { timeout_ms = 1500, lsp_format = "fallback" }
		end,
	},
}
