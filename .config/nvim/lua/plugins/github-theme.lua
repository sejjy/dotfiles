return {
	"projekt0n/github-nvim-theme",

	lazy = false,

	priority = 1000,

	config = function()
		vim.cmd.colorscheme("github_dark_default")

		vim.g.loaded_matchparen = 1

		local float = vim.api.nvim_get_hl(0, { name = "NormalFloat" })

		vim.api.nvim_set_hl(0, "FloatBorder", { bg = float.bg, fg = "#484f58" })
		vim.api.nvim_set_hl(0, "FloatTitle",  { bg = float.bg })
	end,
}
