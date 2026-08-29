return {
	"rmagatti/auto-session",

	lazy = false,

	keys = {
		{ "<Leader>ss", ":AutoSession search<Enter>", desc = "Search sessions" },
	},

	opts = {
		suppressed_dirs = { "/", "~/", "~/Downloads" },

		session_lens = {
			picker_opts = {
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
		},
	},
}
