vim.diagnostic.config({
	severity_sort = true,
	virtual_text = {
		prefix = ""
	},
	underline = true,
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
