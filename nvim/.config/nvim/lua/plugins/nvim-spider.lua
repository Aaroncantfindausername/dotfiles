return {
  "chrisgrieser/nvim-spider",
  lazy = true,
  opts = {
    skipInsignificantPunctuation = false,
  },
  keys = {
    {
      "B",
      "<cmd>lua require('spider').motion('b')<CR>",
      mode = { "n", "o", "x" },
      desc = "Move to start of previous word",
    },

    { "e", "<cmd>lua require('spider').motion('w')<CR>", mode = { "o" }, desc = "Next Sub-word" },
  },
}
