return {
	"christoomey/vim-tmux-navigator",

	keys = {
		{ "<C-h>",  "<Cmd><C-u>TmuxNavigateLeft<Enter>",     desc = "Tmux navigate left" },
		{ "<C-j>",  "<Cmd><C-u>TmuxNavigateDown<Enter>",     desc = "Tmux navigate down" },
		{ "<C-k>",  "<Cmd><C-u>TmuxNavigateUp<Enter>",       desc = "Tmux navigate up" },
		{ "<C-l>",  "<Cmd><C-u>TmuxNavigateRight<Enter>",    desc = "Tmux navigate right" },
		{ "<C-\\>", "<Cmd><C-u>TmuxNavigatePrevious<Enter>", desc = "Tmux navigate previous" },
	},
}
