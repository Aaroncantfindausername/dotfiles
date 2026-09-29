return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    workspaces = {
      {
        name = "Obsidian vault 2",
        path = "~/Documents/Obsidian/Obsidian vault 2",
      },
    },
  },
}
