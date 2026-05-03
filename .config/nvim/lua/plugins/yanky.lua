return {
  "gbprod/yanky.nvim",
  -- enabled = false,
  -- opts = {
  --   picker = {
  --     select = {
  --       action = nil, -- nil to use default put action
  --     },
  --   },
  -- },
  keys = {
    {
      "<leader>p",
      function()
        Snacks.picker.yanky()
      end,
      mode = { "n", "x" },
      desc = "Open Yank History",
    },
  },
}
