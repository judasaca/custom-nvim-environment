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
					"markdown_oxide",
					"prismals",
					"rust_analyzer",
					"sqlls",
					"slint_lsp",
					"somesass_ls",
					"taplo",
					"tailwindcss",
					"astro",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- This provide autopcompletion capabilities
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local base_on_attach = vim.lsp.config.eslint.on_attach
			--- This adds a command to format a document
			vim.lsp.config("eslint", {
				on_attach = function(client, bufnr)
					if not base_on_attach then
						return
					end

					base_on_attach(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "LspEslintFixAll",
					})
				end,
			})
      -- This requires pyright to be insalled: npm i -g pyright
			vim.lsp.config("pyright", { capabilities = capabilities })
      vim.lsp.enable("pyright")
      vim.lsp.enable("eslint")
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
					-- "prettier",
					-- "stylua",
					-- "isort",
					-- "black",
					-- "mypy",
					--"pyright",
				},
			})
		end,
	},
}
