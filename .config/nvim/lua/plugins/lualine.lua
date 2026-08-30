return {
	"nvim-lualine/lualine.nvim",

	lazy = false,

	config = function()
		require("lualine").setup({
			options = { globalstatus = true },

			sections = {
				lualine_a = {
					{
						"mode",
						color = { gui = "bold" },
						separator = { left = "", right = " " },
					},
				},

				lualine_b = {
					{
						"branch",
						icon = "󰘬",
						color = { fg = "#e6edf3", bg = "#161b22" },
						padding = { right = 1 },
						separator = { right = " " },
					},
				},

				lualine_c = {
					{
						"filetype",
						icon_only = true,
						padding = 0,
						separator = "",
					},
					{
						"filename",
						color = { fg = "#e6edf3" },
						padding = { right = 1 },
						separator = ":",
					},
					{
						"diff",
						symbols = { added = "󰐗 ", removed = "󰍶 ", modified = "󰻂 " },
						diff_color = { modified = { fg = "#58a6ff" } },
					},
				},

				lualine_x = {
					{
						"diagnostics",
						symbols = { error = "󰅙 ", warn = "󰀦 ", info = "󰋼 ", hint = "󰋗 " },
						separator = ":",
					},
					{
						"lsp_status",
						icon = "",
						symbols = { spinner = "", done = "", separator = ", " },
						color = { fg = "#e6edf3" },
						padding = { right = 1 },
					},
				},

				lualine_y = {
					{
						"filesize",
						color = { fg = "#e6edf3", bg = "#161b22" },
						separator = { left = "" },
					},
				},

				lualine_z = {
					{
						"location",
						color = { gui = "bold" },
						separator = { left = "", right = "" },
					},
				},
			},
		})

		-- Remove outer separator bg color
		vim.api.nvim_set_hl(0, "StatusLine",   { bg = "NONE" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
	end,
}
