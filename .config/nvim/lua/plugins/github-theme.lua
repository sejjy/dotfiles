return {
	"projekt0n/github-nvim-theme",

	lazy = false,

	priority = 1000,

	config = function()
		vim.cmd.colorscheme("github_dark_default")

		vim.g.loaded_matchparen = 1

		-- C
		vim.api.nvim_set_hl(0, "@boolean.c",           { link = "@variable" })
		vim.api.nvim_set_hl(0, "@character.c",         { link = "@number.c" })
		vim.api.nvim_set_hl(0, "@constant.macro.c",    { link = "@number.c" })
		vim.api.nvim_set_hl(0, "@keyword.operator.c",  { link = "@variable" })
		vim.api.nvim_set_hl(0, "@lsp.type.macro.c",    {})
		vim.api.nvim_set_hl(0, "@string.escape.c",     { bold = false })
		vim.api.nvim_set_hl(0, "@type.builtin.c",      { link = "@variable" })

		local float = vim.api.nvim_get_hl(0, { name = "NormalFloat" })

		vim.api.nvim_set_hl(0, "FloatBorder", { bg = float.bg, fg = "#484f58" })
		vim.api.nvim_set_hl(0, "FloatTitle",  { bg = float.bg })
	end,
}
