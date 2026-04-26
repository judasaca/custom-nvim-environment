return {
	"tpope/vim-dadbod",
	dependencies = {
		"kristijanhusak/vim-dadbod-ui",
		"kristijanhusak/vim-dadbod-completion",
	},
	cmd = { "DB", "DBUI", "DBUIToggle", "DBUIAddConnection" },
	init = function()
		-- init runs before the plugin loads, which is required for vim.g.dbs
		vim.g.dbs = {
			local_db = "postgres://myuser:mypassword@localhost:5432/mydb",
		}

		-- Optional but recommended UI settings
		vim.g.db_ui_use_nerd_fonts = 1
		--vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"
	end,
}
