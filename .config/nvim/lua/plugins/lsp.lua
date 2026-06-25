return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

	config = function()
		local mason_servers = {
			"basedpyright",
			"bashls",
			"clangd",
			"cssls",
			"html",
			"intelephense",
			"jdtls",
			"jsonls",
			"lua_ls",
			"tailwindcss",
			"ts_ls",
		}

		local mason_tools = {
			"clang-format",
			"eslint_d",
			"prettierd",
			"ruff",
			"shellcheck",
			"shfmt",
			"stylua",
		}

		local servers = {
			-- CSS
			cssls = {
				settings = { css = { validate = false } },
			},

			-- Java
			jdtls = {
				name = "jdtls",

				-- `cmd` defines the executable to launch eclipse.jdt.ls.
				-- `jdtls` must be available in $PATH and you must have Python3.9 for this to work.
				--
				-- As alternative you could also avoid the `jdtls` wrapper and launch
				-- eclipse.jdt.ls via the `java` executable
				-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
				cmd = {
					"jdtls",
					"-data",
					vim.fn.stdpath("data")
						.. package.config:sub(1, 1)
						.. "jdtls-workspace"
						.. package.config:sub(1, 1)
						.. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
				},

				-- `root_dir` must point to the root of your project.
				-- See `:help vim.fs.root`
				root_dir = vim.fs.root(0, { ".git", "gradlew", "mvnw" }),

				-- Here you can configure eclipse.jdt.ls specific settings
				-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
				-- for a list of options
				settings = {
					java = {},
				},

				-- This sets the `initializationOptions` sent to the language server
				-- If you plan on using additional eclipse.jdt.ls plugins like java-debug
				-- you'll need to set the `bundles`
				--
				-- See https://codeberg.org/mfussenegger/nvim-jdtls#java-debug-installation
				--
				-- If you don't plan on any eclipse.jdt.ls plugins you can remove this
				--[[
				init_options = {
					bundles = {},
				},
				--]]
			},

			-- Lua
			lua_ls = {
				settings = {
					Lua = {
						completion = { callSnippet = "Replace" },
						diagnostics = {
							globals = { "vim" },
							disable = { "missing-fields" },
						},
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
								"${3rd}/busted/library",
								"${3rd}/love2d/library",
								"${3rd}/luv/library",
							},
						},
					},
				},
			},

			-- Python
			ruff = {
				init_options = {
					settings = {
						lint = {
							enable = false,
						},
					},
				},
			},
		}

		require("mason").setup({
			ui = {
				width = 0.8,
				height = 0.8,
				icons = {
					package_installed = "",
					package_pending = "",
					package_uninstalled = "",
				},
			},
		})

		require("mason-lspconfig").setup({ ensure_installed = mason_servers })
		require("mason-tool-installer").setup({ ensure_installed = mason_tools })

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))

		-- 0.11 fix
		for server, config in pairs(servers) do
			config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
			vim.lsp.config(server, config)
		end
	end,
}
