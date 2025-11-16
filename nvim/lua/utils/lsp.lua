local M = {}

M.on_attach = function(event)
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if not client then
		return
	end
	local bufnr = event.buf
	-- local vim.keymap.set = vim.vim.keymap.set.set
	local opts = {
		nnoremap = true, -- prevent recursive mapping
		silent = false, -- don't print the command to the cli
		buffer = bufnr, -- restrict the vim.keymap.set to the local buffer number
	}

	--! MOVED TO keymaps.lua 

	-- -- native neovim keymaps
	-- vim.keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- goto definition
	-- vim.keymap.set("n", "<leader>gS", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts) -- goto definition in split
	-- vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- Code actions
	-- vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts) -- Rename symbol
	-- vim.keymap.set("n", "<leader>D", "<cmd>lua vim.diagnostic.open_float({ scope = 'line' })<CR>", opts) -- Line diagnostics (float)
	-- vim.keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts) -- Cursor diagnostics
	-- vim.keymap.set("n", "<leader>pd", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts) -- previous diagnostic
	-- vim.keymap.set("n", "<leader>nd", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts) -- next diagnostic
	-- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- hover documentation

	-- -- fzf-lua keymaps
	-- vim.keymap.set("n", "<leader>gd", "<cmd>FzfLua lsp_finder<CR>", opts) -- LSP Finder (definition + references)
	-- vim.keymap.set("n", "<leader>gr", "<cmd>FzfLua lsp_references<CR>", opts) -- Show all references to the symbol under the cursor
	-- vim.keymap.set("n", "<leader>gt", "<cmd>FzfLua lsp_typedefs<CR>", opts) -- Jump to the type definition of the symbol under the cursor
	-- vim.keymap.set("n", "<leader>ds", "<cmd>FzfLua lsp_document_symbols<CR>", opts) -- List all symbols (functions, classes, etc.) in the current file
	-- vim.keymap.set("n", "<leader>ws", "<cmd>FzfLua lsp_workspace_symbols<CR>", opts) -- Search for any symbol across the entire project/workspace
	-- vim.keymap.set("n", "<leader>gi", "<cmd>FzfLua lsp_implementations<CR>", opts) -- Go to implementation

	-- Order Imports (if supported by the client LSP)
	if client:supports_method("textDocument/codeAction", bufnr) then
		vim.keymap.set("n", "<leader>oi", function()
			vim.lsp.buf.code_action({
				context = {
					only = { "source.organizeImports" },
					diagnostics = {},
				},
				apply = true,
				bufnr = bufnr,
			})
			-- format after changing import order
			vim.defer_fn(function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end, 50) -- slight delay to allow for the import order to go first
		end, opts)
	end

	-- === DAP keymaps ===
	-- if client.name == "rust-analyzer" then -- debugging only configured for Rust
	-- 	local dap = require("dap")
	-- 	vim.keymap.set("n", "<leader>dc", dap.continue, opts) -- Continue / Start
	-- 	vim.keymap.set("n", "<leader>do", dap.step_over, opts) -- Step over
	-- 	vim.keymap.set("n", "<leader>di", dap.step_into, opts) -- Step into
	-- 	vim.keymap.set("n", "<leader>du", dap.step_out, opts) -- Step out
	-- 	vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, opts) -- Toggle breakpoint
	-- 	vim.keymap.set("n", "<leader>dr", dap.repl.open, opts) -- Open DAP REPL
	-- end
end

return M
