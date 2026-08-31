return {
	"folke/snacks.nvim",

	event = "VeryLazy",

	opts = {
		picker = {
			prompt = " > ",
			formatters = { file = { filename_first = true } },

			icons = {
				undo = { saved = "󰆓" },
				ui = { selected = " ", unselected = " " },
			},

			layout = {
				reverse = true,
				layout = {
					box = "horizontal",
					backdrop = false,
					width  = 0.8,
					height = 0.9,
					border = "none",
					{
						box = "vertical",
						{ win = "list",              border = "single", title = " Results ",              title_pos = "center" },
						{ win = "input", height = 1, border = "single", title = "{title} {live} {flags}", title_pos = "center" },
					},
					{ win = "preview", width = 0.45, border = "single", title = "{preview:Preview}",      title_pos = "center" },
				},
			},

			sources = {
				buffers = { current = false },
				files   = { hidden = true },
				grep    = { hidden = true },
				grep_word = {
					hidden = true,
					search = function(prompt)
						return " " .. prompt:word()
					end,
				},
			},

			win = {
				input = {
					keys = {
						["<Esc>"] = { "close",               mode = { "n", "i" } },
						["<C-u>"] = { "preview_scroll_up",   mode = { "n", "i" } },
						["<C-d>"] = { "preview_scroll_down", mode = { "n", "i" } },
					},
				},
			},
		},
	},

	config = function(_, opts)
		require("snacks").setup(opts)

		local picker = require("snacks").picker
		vim.keymap.set("n",          "<Leader><Leader>", picker.buffers,      { desc = "Search open buffers" })
		vim.keymap.set("n",          "<Leader>s.",       picker.recent,       { desc = "Search recent files" })
		vim.keymap.set("n",          "<Leader>sb",       picker.grep_buffers, { desc = "Grep open buffers" })
		vim.keymap.set("n",          "<Leader>sf",       picker.files,        { desc = "Search files" })
		vim.keymap.set("n",          "<Leader>sg",       picker.grep,         { desc = "Grep" })
		vim.keymap.set("n",          "<Leader>sh",       picker.help,         { desc = "Search help pages" })
		vim.keymap.set("n",          "<Leader>sk",       picker.keymaps,      { desc = "Search keymaps" })
		vim.keymap.set("n",          "<Leader>sm",       picker.man,          { desc = "Search man pages" })
		vim.keymap.set("n",          "<Leader>sr",       picker.resume,       { desc = "Resume search" })
		vim.keymap.set("n",          "<Leader>su",       picker.undo,         { desc = "Search undo history" })
		vim.keymap.set({ "n", "x" }, "<Leader>sc",       picker.grep_word,    { desc = "Grep current word" })
	end,
}
