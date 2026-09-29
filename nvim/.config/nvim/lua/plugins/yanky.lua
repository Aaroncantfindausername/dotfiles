return {
  "gbprod/yanky.nvim",
  opts = {
    preserve_cursor_position = {
      enabled = true,
    },
  },
  dependencies = { "folke/snacks.nvim" },
  keys = {
    {
      "<leader>p",
      function()
        Snacks.picker.yanky()
      end,
      mode = { "n" },
      desc = "Open Yank History",
    },
    {
      "<leader>p",
      function()
        Snacks.picker.yanky({
          actions = {
            confirm = function(picker, item)
              picker:close()
              if not item then
                return
              end
              vim.cmd('normal! gv"_d')
              require("yanky.picker").actions.put("P", false)(item)
            end,
          },
        })
      end,
      mode = { "x" },
      desc = "Replace selection with Yank History",
    },
  },
}
-- hehehe he thsa nrdesc s, falsei,edesc h nrtsieah
