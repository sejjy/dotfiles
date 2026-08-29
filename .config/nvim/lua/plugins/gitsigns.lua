return {
	"lewis6991/gitsigns.nvim",

	event = "VeryLazy",

	opts = {
		on_attach = function(buffer)
			local gitsigns = require("gitsigns")

			-- Navigation
			vim.keymap.set("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, { desc = "Git: Next change", buffer = buffer })

			vim.keymap.set("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, { desc = "Git: Previous change", buffer = buffer })

			-- Actions
			vim.keymap.set("n", "<Leader>gs", gitsigns.stage_hunk, { desc = "Git: Stage", buffer = buffer })
			vim.keymap.set("n", "<Leader>gr", gitsigns.reset_hunk, { desc = "Git: Reset", buffer = buffer })

			vim.keymap.set("v", "<Leader>gs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Git: Stage selection", buffer = buffer })

			vim.keymap.set("v", "<Leader>gr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Git: Reset selection", buffer = buffer })

			vim.keymap.set("n", "<Leader>gS", gitsigns.stage_buffer,        { desc = "Git: Stage buffer",   buffer = buffer })
			vim.keymap.set("n", "<Leader>gR", gitsigns.reset_buffer,        { desc = "Git: Reset buffer",   buffer = buffer })
			vim.keymap.set("n", "<Leader>gp", gitsigns.preview_hunk,        { desc = "Git: Preview",        buffer = buffer })
			vim.keymap.set("n", "<Leader>gi", gitsigns.preview_hunk_inline, { desc = "Git: Inline preview", buffer = buffer })

			vim.keymap.set("n", "<Leader>gb", function()
				gitsigns.blame_line({ full = true })
			end, { desc = "Git: Blame full", buffer = buffer })

			vim.keymap.set("n", "<Leader>gQ", function()
				gitsigns.setqflist("all")
			end, { desc = "Git: Quickfix all hunks", buffer = buffer })

			vim.keymap.set("n", "<Leader>gq", gitsigns.setqflist, { desc = "Git: Quickfix hunks", buffer = buffer })

			-- Toggles
			vim.keymap.set("n", "<Leader>tb", gitsigns.toggle_current_line_blame, { desc = "Git: Toggle current line blame", buffer = buffer })
			vim.keymap.set("n", "<Leader>tl", gitsigns.toggle_deleted,            { desc = "Git: Toggle deleted lines",      buffer = buffer })
			vim.keymap.set("n", "<Leader>tw", gitsigns.toggle_word_diff,          { desc = "Git: Toggle word diff",          buffer = buffer })

			-- Text object
			vim.keymap.set({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Git: Inner hunk", buffer = buffer })
		end,
	},
}
