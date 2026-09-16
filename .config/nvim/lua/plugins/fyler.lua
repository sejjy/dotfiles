return {
	"FylerOrg/fyler.nvim",

	tag = "v2.0.0",

	cmd = "Fyler",

	keys = {
		{ "<Leader>e", ":Fyler<Enter>", desc = "File explorer", silent = true },
	},

	opts = {
		views = {
			finder = {
				default_explorer = true,

				icon = {
					directory_collapsed = "󰉋",
					directory_expanded = "󰝰",
				},

				win = {
					kind = "float",
					kinds = {
						float = {
							width = "37",
							height = "90%",
							top = "0",
							left = "100%",
						},
					},
					win_opts = {
						winhighlight = "Normal:NormalFloat",
						cursorline = false,
						number = true,
						relativenumber = true,
					},
				},
			},
		},
	},
}
