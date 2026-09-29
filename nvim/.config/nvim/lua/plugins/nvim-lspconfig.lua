return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
          -- stylua: ignore
          keys = {
            { "<leader>sS", function() Snacks.picker.lsp_symbols({ filter = LazyVim.config.kind_filter }) end, desc = "LSP Symbols", has = "documentSymbol" },
            { "<leader>ss", function() Snacks.picker.lsp_workspace_symbols({ filter = LazyVim.config.kind_filter }) end, desc = "LSP Workspace Symbols", has = "workspace/symbols" },
          },
      },
    },
  },
}
