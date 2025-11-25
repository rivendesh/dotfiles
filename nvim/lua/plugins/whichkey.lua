-- ================================================================================================
-- TITLE : which-key
-- ABOUT : WhichKey helps you remember your Neovim keymaps, by showing keybindings as you type.
-- LINKS :
--   > github : https://github.com/folke/which-key.nvim
-- ================================================================================================

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- Fix spacebar lag in insert mode by disabling which-key wait on <Space>
		triggers = { "<leader>" }, -- the only valid format

		triggers_no_wait = {
			-- In insert mode, do NOT wait on "<space>"
			i = { "<space>" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}

