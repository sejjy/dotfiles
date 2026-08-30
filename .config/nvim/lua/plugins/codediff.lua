return {
	"esmuellert/codediff.nvim",

	cmd = "CodeDiff",

	keys = {
		{ "<Leader>cd", ":CodeDiff<Enter>",         desc = "Code diff" },
		{ "<Leader>ch", ":CodeDiff history<Enter>", desc = "Code diff history" },
	},

	config = function()
		require("codediff").setup({
			explorer = {
				view_mode = "tree",
				position  = "right",
				width  = 38,
				height = 45,
				indent_markers = true,

				icons = {
					folder_closed = "󰉋",
					folder_open   = "󰝰",
				},
			},
		})

		-- Disable cursorline in diff windows
		vim.api.nvim_create_autocmd("User", {
			pattern  = "CodeDiffOpen",
			callback = function()
				for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
					vim.wo[win].cursorline = false
				end
			end,
		})

		-- Hide tabline while CodeDiff is open

		vim.api.nvim_create_autocmd("User", {
			pattern  = "CodeDiffOpen",
			callback = function()
				vim.g.codediff_saved_showtabline = vim.o.showtabline
				vim.o.showtabline = 0
			end,
		})

		vim.api.nvim_create_autocmd("User", {
			pattern  = "CodeDiffClose",
			callback = function()
				if vim.g.codediff_saved_showtabline then
					vim.o.showtabline = vim.g.codediff_saved_showtabline
					vim.g.codediff_saved_showtabline = nil
				end
			end,
		})
	end,
}
