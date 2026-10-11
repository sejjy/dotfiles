local visible = false

vim.diagnostic.config({
	severity_sort = true,
	virtual_text = false,
	underline = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅙 ",
			[vim.diagnostic.severity.WARN]  = "󰀦 ",
			[vim.diagnostic.severity.INFO]  = "󰋼 ",
			[vim.diagnostic.severity.HINT]  = "󰋗 ",
		},
	},
})

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn",  { undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo",  { undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint",  { undercurl = true })

vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics" })

vim.keymap.set("n", "<Leader>tv", function()
	visible = not visible
	vim.diagnostic.config({
		virtual_text = visible and {
			prefix = "",
		} or false,
		underline = visible,
	})
end, { desc = "Toggle virtual text" })
