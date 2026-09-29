return {
  "folke/which-key.nvim",
  opts_extend = { "spec" },
  opts = {
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>i", group = "iron (REPL)", icon = "" },
        { "<leader>t", group = "bool toggle", icon = "" },

        { "<leader>m", group = "marks", icon = "" },
        { "<leader>b", group = "bookmarks && buffers", icon = "" },
      },
    },
  },
}
