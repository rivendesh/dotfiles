-- TITLE : auto-commands
-- ABOUT : automatically run code on defined events (e.g. save, yank)

-- Restore last cursor position when reopening a file
local last_cursor_group = vim.api.nvim_create_augroup("LastCursorGroup", {})
vim.api.nvim_create_autocmd("BufReadPost", {
	group = last_cursor_group,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Highlight the yanked text for 200ms
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_yank_group,
	pattern = "*",
	callback = function()
		vim.hl.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- Format on save using efm langserver and configured formatters
local lsp_fmt_group = vim.api.nvim_create_augroup("FormatOnSaveGroup", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	group = lsp_fmt_group,
	callback = function()
		-- Check if efm is active
		local efm = vim.lsp.get_clients({ name = "efm" })
		if vim.tbl_isempty(efm) then
			return
		end
		-- Apply format if efm is active
		vim.lsp.buf.format({ name = "efm", async = true })
	end,
})

vim.api.nvim_create_autocmd("TermOpen", {
	desc = "Remove line numbers in the terminal",
	callback = function()
		vim.wo.number = false
	end,
})

-- on_attach function shortcuts
-- local on_attach = require("utils.lsp").on_attach
-- local lsp_on_attach_group = vim.api.nvim_create_augroup("LspMappings", {})
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = lsp_on_attach_group,
-- 	callback = on_attach,
-- })

local api = vim.api

-- Set indent width for specific languages
api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
		vim.opt_local.expandtab = true
	end,
})

api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.expandtab = true
	end,
})

api.nvim_create_autocmd("FileType", {
	pattern = { "yaml", "yml" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.expandtab = true
	end,
})

api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.expandtab = true
	end,
})
