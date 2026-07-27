return {
	"projekt0n/github-nvim-theme",

	name = "github-theme",

	lazy = false,

	priority = 1000,

	config = function()
		vim.g.loaded_matchparen = 1

		require("github-theme").setup({
			specs = {
				all = {
					syntax = {
						comment = "#6e7681",
						operator = "#ff7b72",
						preproc = "#d2a8ff",
					},
				},
			},
		})

		vim.cmd.colorscheme("github_dark_default")

		local float = vim.api.nvim_get_hl(0, { name = "NormalFloat" })

		vim.api.nvim_set_hl(0, "FloatBorder", { bg = float.bg, fg = "#484f58" })
		vim.api.nvim_set_hl(0, "FloatTitle", { bg = float.bg })

		-- Bash
		vim.api.nvim_set_hl(0, "bashStatement", { fg = "#e6edf3" })

		-- C
		vim.api.nvim_set_hl(0, "@constant.macro", { fg = "#e6edf3" })

		-- Sh
		vim.api.nvim_set_hl(0, "shDerefSimple", { fg = "#e6edf3" })
		vim.api.nvim_set_hl(0, "shDerefVar", { fg = "#e6edf3" })
		vim.api.nvim_set_hl(0, "shHereDoc02", { fg = "#a5d6ff" })
		vim.api.nvim_set_hl(0, "shNumber", { fg = "#e6edf3" })
		vim.api.nvim_set_hl(0, "shQuote", { fg = "#a5d6ff" })
	end,
}
