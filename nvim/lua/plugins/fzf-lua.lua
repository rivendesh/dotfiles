-- ================================================================================================
-- TITLE : fzf-lua
-- LINKS :
--   > github : https://github.com/ibhagwan/fzf-lua
-- ABOUT : lua-based fzf wrapper and integration.
-- ================================================================================================

return {
	"ibhagwan/fzf-lua",
	lazy = false,

	dependencies = { "nvim-mini/mini.icons" },

	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "FZF Files",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "FZF Live Grep",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "FZF Buffers",
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").help_tags()
			end,
			desc = "FZF Help Tags",
		},
		{
			"<leader>fx",
			function()
				require("fzf-lua").diagnostics_document()
			end,
			desc = "FZF Diagnostics (Document)",
		},
		{
			"<leader>fX",
			function()
				require("fzf-lua").diagnostics_workspace()
			end,
			desc = "FZF Diagnostics (Workspace)",
		},
		{
			"<leader>fs",
			function()
				require("fzf-lua").lsp_document_symbols()
			end,
			desc = "FZF Symbols (Document)",
		},
		{
			"<leader>fS",
			function()
				require("fzf-lua").lsp_workspace_symbols()
			end,
			desc = "FZF Symbols (Workspace)",
		},
	},

	opts = function()
		local actions = require("fzf-lua").actions
		return {
			actions = {
				-- FIX: Enter opens only a single file
				["default"] = actions.file_edit,

				-- Extra convenience binds
				["ctrl-s"] = actions.file_split,
				["ctrl-v"] = actions.file_vsplit,
				["ctrl-t"] = actions.file_tabedit,
			},
		}
	end,
}
