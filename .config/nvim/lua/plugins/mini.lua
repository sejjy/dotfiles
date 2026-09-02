return {
	{
		"nvim-mini/mini.ai",

		event = "VeryLazy",

		config = function()
			require("mini.ai").setup({ n_lines = 500 })
		end,
	},
	{
		"nvim-mini/mini.surround",

		event = "VeryLazy",

		config = function()
			require("mini.surround").setup({
				mappings = {
					add            = "gsa", -- Add surrounding
					delete         = "gsd", -- Delete surrounding
					find           = "gsf", -- Find surrounding (to the right)
					find_left      = "gsF", -- Find surrounding (to the left)
					highlight      = "gsh", -- Highlight surrounding
					replace        = "gsr", -- Replace surrounding
					update_n_lines = "gsn", -- Update `n_lines`
				},
				n_lines = 500,
			})
		end,
	},
	{
		"nvim-mini/mini.icons",

		lazy = false,

		config = function()
			require("mini.icons").mock_nvim_web_devicons()

			require("mini.icons").setup({
				file = {
					LICENSE         = { glyph = "", hl = "MiniIconsOrange" },
					["LICENSE.md"]  = { glyph = "", hl = "MiniIconsOrange" },
					["LICENSE.txt"] = { glyph = "", hl = "MiniIconsOrange" },
					README          = { glyph = "󰋽", hl = "MiniIconsCyan" },
					["README.md"]   = { glyph = "󰋽", hl = "MiniIconsCyan" },
					["README.txt"]  = { glyph = "󰋽", hl = "MiniIconsCyan" },
					["init.lua"]    = { glyph = "󰢱", hl = "MiniIconsAzure" },
				},
				filetype = {
					css           = { glyph = "", hl = "MiniIconsPurple" },
					git           = { glyph = "󰊢", hl = "MiniIconsOrange" },
					gitattributes = { glyph = "󰊢", hl = "MiniIconsOrange" },
					gitcommit     = { glyph = "󰊢", hl = "MiniIconsOrange"  },
					gitconfig     = { glyph = "󰊢", hl = "MiniIconsOrange" },
					gitignore     = { glyph = "󰊢", hl = "MiniIconsOrange" },
					gitrebase     = { glyph = "󰊢", hl = "MiniIconsOrange"  },
					gitsendemail  = { glyph = "󰊢", hl = "MiniIconsOrange"   },
					sh            = { glyph = "", hl = "MiniIconsGreen" },
				},
			})
		end,
	},
}
