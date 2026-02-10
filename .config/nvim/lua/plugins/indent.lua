return {
	"saghen/blink.indent",

	event = "BufReadPost",

	config = function()
		local indent = require("blink.indent")

		vim.keymap.set("n", "<Leader>ti", function()
			indent.enable(not indent.is_enabled())
		end, { desc = "toggle [i]ndent guides" })

		vim.api.nvim_set_hl(0, "BlinkIndentFocused", { default = true, fg = "#808080" })
		vim.api.nvim_set_hl(0, "BlinkIndentFocusedUnderline", { default = true, sp = "#808080", underline = true })

		indent.setup({
			static = {
				enabled = true,
				char = "▏",
				highlights = { "BlinkIndent" },
			},

			scope = {
				enabled = true,
				char = "▏", -- "▎"
				highlights = { "BlinkIndentFocused" },

				underline = {
					enabled = true,
					highlights = { "BlinkIndentFocusedUnderline" },
				},
			},
		})
	end,
}
