-- Bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

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
