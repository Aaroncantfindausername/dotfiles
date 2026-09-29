return {
  "folke/flash.nvim",
  opts = {
    labels = "haeistrnodulfgpwbcymxq",
  },
  keys = {

    {
      "h",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
  },
}
