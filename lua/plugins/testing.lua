return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
		"marilari88/neotest-vitest",
	},
	config = function()
		local neotest = require("neotest")
		neotest.setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
					runner = "pytest",
				}),
				require("neotest-vitest"),
			},
		})
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { desc = desc, silent = true })
		end

		-- Run tests
		map("n", "<leader>tn", function()
			neotest.run.run()
		end, "Test nearest")

		map("n", "<leader>tf", function()
			neotest.run.run(vim.fn.expand("%"))
		end, "Test file")

		map("n", "<leader>ts", function()
			neotest.run.run(vim.fn.getcwd())
		end, "Test suite")

		map("n", "<leader>td", function()
			neotest.run.run({ strategy = "dap" })
		end, "Debug nearest test")

		-- Test UI
		map("n", "<leader>to", function()
			neotest.output.open({ enter = true })
		end, "Test output")

		map("n", "<leader>tO", function()
			neotest.output_panel.toggle()
		end, "Test output panel")

		map("n", "<leader>tt", function()
			neotest.summary.toggle()
		end, "Test summary")

		map("n", "<leader>tS", function()
			neotest.run.stop()
		end, "Stop tests")

		-- Watch mode
		map("n", "<leader>tw", function()
			neotest.watch.toggle(vim.fn.expand("%"))
		end, "Watch tests")
	end,
}
