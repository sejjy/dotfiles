return {
	"marchyman/virt-column.nvim",

	event = "VeryLazy",

	config = function()
		local function toggle_colorcolumn()
			vim.wo.colorcolumn = (vim.wo.colorcolumn == "" and "80") or ""
		end

		local group = vim.api.nvim_create_augroup("color-column", { clear = true })

		vim.api.nvim_create_autocmd("InsertEnter", {
			pattern  = "*",
			group    = group,
			callback = function()
				vim.w.column_number = vim.wo.colorcolumn
				vim.wo.colorcolumn = ""
			end,
		})

		vim.api.nvim_create_autocmd("InsertLeave", {
			pattern  = "*",
			group    = group,
			callback = function()
				vim.wo.colorcolumn = vim.w.column_number or ""
			end,
		})

		require("virt-column").setup({ char = "│" })

		vim.keymap.set("n", "<Leader>tc", toggle_colorcolumn, { desc = "Toggle color column" })
	end,
}
