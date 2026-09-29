--if true then
--  return {}
--end
return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      picker = {
        sources = {
          explorer = {
            win = {
              -- input window
              input = {
                keys = {
                  -- to close the picker on ESC instead of going to normal mode,
                  -- add the following keymap to your config
                  --["<Esc>"] = { "close", mode = { "n", "i" } },
                  ["h"] = "list_down",
                  ["a"] = "list_up",
                  ["k"] = "list_bottom",
                },
              },
              -- result list window
              list = {
                keys = {
                  ["h"] = "list_down",
                  ["a"] = "list_up",
                  ["l"] = "explorer_add",
                  ["e"] = "confirm",
                  ["k"] = "explorer_close",
                },
              },
              -- preview window
              preview = {
                keys = {
                  ["<Esc>"] = "cancel",
                  ["q"] = "close",
                  ["i"] = "focus_input",
                  ["<a-w>"] = "cycle_win",
                },
              },
            },
          },
        },
      },
    },
  },
}
