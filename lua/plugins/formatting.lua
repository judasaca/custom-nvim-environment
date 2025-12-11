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
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 2500,
			lsp_format = "fallback",
		},
	},
}
