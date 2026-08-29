vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function() vim.hl.on_yank() end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local buffer = event.buf

		vim.keymap.set("n", "gd",         vim.lsp.buf.definition,       { buffer = buffer, desc = "Go to definition" })
		vim.keymap.set("n", "grd",        vim.lsp.buf.declaration,      { buffer = buffer, desc = "Go to declaration" })
		vim.keymap.set("n", "gri",        vim.lsp.buf.implementation,   { buffer = buffer, desc = "Go to implementation" })
		vim.keymap.set("n", "grn",        vim.lsp.buf.rename,           { buffer = buffer, desc = "Rename" })
		vim.keymap.set("n", "grr",        vim.lsp.buf.references,       { buffer = buffer, desc = "References" })
		vim.keymap.set("n", "grt",        vim.lsp.buf.type_definition,  { buffer = buffer, desc = "Go to type definition" })
		vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action,      { buffer = buffer, desc = "Code action" })
		vim.keymap.set("n", "<Leader>sd", vim.lsp.buf.document_symbol,  { buffer = buffer, desc = "Document symbols" })
		vim.keymap.set("n", "<Leader>sw", vim.lsp.buf.workspace_symbol, { buffer = buffer, desc = "Workspace symbols" })
		vim.keymap.set("n", "K",          vim.lsp.buf.hover,            { buffer = buffer, desc = "Hover" })

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method("textDocument/documentHighlight", buffer) then
			local group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = buffer,
				group = group,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = buffer,
				group = group,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(eventd)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = eventd.buf })
				end,
			})
		end
	end,
})

-- https://github.com/folke/lazy.nvim/issues/1951
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lazy_backdrop",
	group = vim.api.nvim_create_augroup("lazy-backdrop", { clear = true }),
	callback = function(ctx)
		local win = vim.fn.win_findbuf(ctx.buf)[1]
		vim.api.nvim_win_set_config(win, { border = "none" })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "mason",
	group = vim.api.nvim_create_augroup("mason-cursorline", { clear = true }),
	callback = function()
		vim.wo.cursorline = false
	end,
})
