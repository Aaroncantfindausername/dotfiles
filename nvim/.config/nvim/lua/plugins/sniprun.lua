return {
  "michaelb/sniprun",
  enabled = false,
  branch = "master",

  build = "sh install.sh 1",
  -- do 'sh install.sh 1' if you want to force compile locally
  -- (instead of fetching a binary from the github release). Requires Rust >= 1.65

  config = function()
    require("sniprun").setup({
      -- your options
      repl_enable = { "Python3_original", "Python3_jupyter", "Python3_fifo" },
      selected_interpreters = { "Python3_fifo" },
    })
  end,
  keys = {
    {
      "<leader>r",
      function()
        require("sniprun").run("v")
      end,
      desc = "Sniprun selection",
      mode = { "v" },
    },

    {
      "<leader>rr",
      function()
        require("sniprun").run()
      end,
      desc = "Sniprun line",
    },

    {
      "<leader>ri",
      function()
        require("sniprun").info()
      end,
      desc = "Snip info",
    },

    {
      "<leader>rx",
      function()
        require("sniprun").reset()
      end,
      desc = "Snip reset/kill",
    },

    {
      "<leader>rd",
      function()
        require("sniprun.display").close_all()
      end,
      desc = "Sniprun close output",
    },

    {
      "<leader>rC",
      function()
        require("sniprun").clear_repl()
      end,
      desc = "Sniprun REPL clear memory",
    },
  },
}
