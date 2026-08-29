-- This is crazy
vim.pack.add({
	{ src = "https://github.com/folke/lazy.nvim", version = "stable" },
})

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},

	install = {
		missing = true,
		colorscheme = { "github_dark_default" },
	},

	checker = {
		enabled = true,
		notify  = false,
	},

	change_detection = {
		enabled = true,
		notify  = false,
	},

	ui = {
		border = "single",
		icons = {
			cmd        = ":",
			config     = " ",
			debug      = " ",
			event      = " ",
			favorite   = " ",
			ft         = " ",
			init       = " ",
			import     = " ",
			keys       = " ",
			lazy       = "",
			list       = { "", "", "", "" },
			loaded     = "",
			not_loaded = "",
			plugin     = "󰏗 ",
			runtime    = " ",
			require    = "󰢱 ",
			source     = " ",
			start      = "󰼛 ",
			task       = "󰄬 ",
		},
	},
})
