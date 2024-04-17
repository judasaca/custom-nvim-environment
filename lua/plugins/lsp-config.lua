return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"bashls",
					"cssls",
					"dockerls",
					"docker_compose_language_service",
					"eslint",
					"html",
					--"htmx",
					"jsonls",
					"tsserver",
					"jinja_lsp",
					"markdown_oxide",
					"prismals",
					"pyright",
					"rust_analyzer",
					"sqlls",
					"slint_lsp",
					"somesass_ls",
					"taplo",
					"tailwindcss",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.tsserver.setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.prismals.setup({ capabilities = capabilities })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"isort",
					"black",
					"pylint",
					"eslint_d",
				},
			})
		end,
	},
}
