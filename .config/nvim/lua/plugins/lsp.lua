return {
	"neovim/nvim-lspconfig",

	event = "VeryLazy",

	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

	config = function()
		vim.lsp.config("cssls", {
			settings = { css = { validate = false } },
		})

		vim.lsp.config("jdtls", {
			settings = {
				java = {
					project = {
						outputPath  =   "bin",
						sourcePaths = { "src" },
					},
				},
			},
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		vim.lsp.config("ruff", {
			init_options = {
				settings = {
					lint = {
						enable = false,
					},
				},
			},
		})

		require("mason").setup({
			ui = {
				width  = 0.8,
				height = 0.8,
				icons = {
					package_installed   = "",
					package_pending     = "",
					package_uninstalled = "",
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"basedpyright",
				"bashls",
				"clangd",
				"cssls",
				"html",
				"jdtls",
				"jsonls",
				"lua_ls",
				-- "tailwindcss",
				"ts_ls",
			}
		})

		vim.schedule(function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"clang-format",
					"eslint_d",
					"prettierd",
					"ruff",
					"shellcheck",
					"shfmt",
					"stylua",
				}
			})
		end)
	end,
}
