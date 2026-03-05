return {
	"marchyman/virt-column.nvim",

	config = function()
		local function toggle_colorcolumn()
			vim.wo.colorcolumn = (vim.wo.colorcolumn == "" and "80") or ""
		end

		local colorcolumn_group = vim.api.nvim_create_augroup("ColorcolumnGroup", { clear = true })

		vim.api.nvim_create_autocmd("InsertEnter", {
			group = colorcolumn_group,
			pattern = "*",
			callback = function()
				vim.w.column_number = vim.wo.colorcolumn
				vim.wo.colorcolumn = ""
			end,
		})

		vim.api.nvim_create_autocmd("InsertLeave", {
			group = colorcolumn_group,
			pattern = "*",
			callback = function()
				vim.wo.colorcolumn = vim.w.column_number or ""
			end,
		})

		require("virt-column").setup({ char = "│" })

		vim.keymap.set("n", "<Leader>tc", toggle_colorcolumn, { desc = "toggle color [c]olumn" })
	end,
}
