return {
  "emmanueltouzery/apidocs.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "folke/snacks.nvim",
  },
  cmd = { "ApidocsSearch", "ApidocsInstall", "ApidocsOpen", "ApidocsSelect", "ApidocsUninstall" },
  opts = {},
  keys = {
    { "<leader>se", "<cmd>ApidocsOpen<cr>", desc = "Search Api Doc" },
  },
}
