return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  init = function()
    -- 1. Disable default mappings
    vim.g.tmux_navigator_no_mappings = 1
  end,
}
