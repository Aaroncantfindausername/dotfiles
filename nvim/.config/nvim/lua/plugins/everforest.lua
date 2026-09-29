return {
  {
    "neanias/everforest-nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("everforest").setup({
        background = "hard",
        transparent_background_level = 1,

        italics = true,
        colours_override = function(palette)
          palette.bg5 = "#859289"
          -- palette.bg4 = "#3A4347"
        end,
      })
    end,
  },
  -- configure lazyvim to load everforest
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
