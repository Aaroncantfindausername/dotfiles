return {
  "folke/snacks.nvim",
  opts = {},
  keys = {
    { "<leader>fR", LazyVim.pick("oldfiles"), desc = "Recent" },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent({ filter = { cwd = true } })
      end,
      desc = "Recent (cwd)",
    },
  },
}
