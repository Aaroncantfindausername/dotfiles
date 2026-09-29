return {
  {
    "Vigemus/iron.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- optional, for IronRestart command
    },
    lazy = false,
    opts = {
      config = {
        repl_open_cmd = function(buffnr)
          return require("iron.view").split.horizontal(0.30)(buffnr)
        end,
        dap_integration = true,
        ignore_blank_lines = true,

        repl_definition = {
          -- setting up code_dividers for core.send_code_block
          python = {
            command = { "uv", "run", "ipython", "--no-autoindent" }, -- or { "ipython", "--no-autoindent" }
            block_dividers = { "# %%", "#%%" },
            format = function(lines, extra)
              return require("iron.fts.common").bracketed_paste_python(lines, extra)
            end,
            env = { PYTHON_BASIC_REPL = "1" },
          },
        },
      },
      keymaps = {
        toggle_repl = "<space>ir", -- toggles the repl open and closed.
        -- If repl_open_command is a table as above, then the following keymaps are
        -- available
        -- toggle_repl_with_cmd_1 = "<space>rv",
        -- toggle_repl_with_cmd_2 = "<space>rh",
        restart_repl = "<space>iR", -- calls `IronRestart` to restart the repl
        send_motion = "<space>ic",
        visual_send = "<space>i",
        send_file = "<space>if",
        send_line = "<space>ii",
        send_paragraph = "<space>ip",
        send_until_cursor = "<space>iu",
        send_mark = "<space>im",
        send_code_block = "<space>ib",
        send_code_block_and_move = "<space>in",
        mark_motion = "<space>mc",
        mark_visual = "<space>mc",
        remove_mark = "<space>md",
        cr = "<space>i<cr>",
        interrupt = "<space>i<space>",
        exit = "<space>iq",
        clear = "<space>il",
      },
    },
  },
}
