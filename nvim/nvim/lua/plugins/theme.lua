return {
  "savq/melange-nvim",
  -- "rebelot/kanagawa.nvim",
  -- 'AlexvZyl/nordic.nvim',
  lazy = false,
  italic = true,
  priority = 1000,
  config = function()
    vim.g.melange_enable_font_variants = 0    -- disable font variants
    vim.cmd('colorscheme melange')
  end
}
