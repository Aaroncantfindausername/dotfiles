-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymap
local opts = { noremap = true, silent = true }
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
--vim.keymap.set("n", "<localleader>", '<cmd>lua require("which-key").show("\\\\")<cr>')
vim.keymap.set("n", "<Return>", "o<Esc>", { desc = "New line in normal mode" })
-- remap nav keys for akl
vim.keymap.set({ "n", "v" }, "k", "h", { noremap = true, desc = "Left" })
vim.keymap.set({ "n", "v" }, "h", "j", { noremap = true, desc = "Down" })
vim.keymap.set({ "n", "v" }, "a", "k", { noremap = true, desc = "Up" })
vim.keymap.set({ "n", "v" }, "e", "l", { noremap = true, desc = "Right" })
vim.keymap.set({ "n", "v" }, "j", "e", { noremap = true, desc = "Next end of word" })
vim.keymap.set({ "n", "v" }, "l", "a", { noremap = true, desc = "Around" })
vim.keymap.set({ "x" }, "a", "k", opts)
vim.keymap.set("n", "<S-l>", "A", { noremap = true })
-- Unmap default window navigation keys
-- vim.keymap.del("n", "<C-h>")
-- vim.keymap.del("n", "<C-j>")
-- vim.keymap.del("n", "<C-k>")
-- vim.keymap.del("n", "<C-l>")

-- Normal mode window movement (replaced with vimtumx navigator)
-- vim.keymap.set("n", "<C-k>", "<C-w>h", { desc = "Move to left window", noremap = true, silent = true })
-- vim.keymap.set("n", "<C-h>", "<C-w>j", { desc = "Move to below window", noremap = true, silent = true })
-- vim.keymap.set("n", "<C-a>", "<C-w>k", { desc = "Move to above window", noremap = true, silent = true })
-- vim.keymap.set("n", "<C-e>", "<C-w>l", { desc = "Move to right window", noremap = true, silent = true })
-- Terminal mode (exit to normal, then move)
-- Unmap default shift-h/l for buffer nav
vim.keymap.del("n", "<S-h>")
--vim.keymap.del("n", "<S-l>")

-- Map Shift-K and Shift-E
vim.keymap.set("n", "<S-A>", "<cmd>bprevious<CR>", opts)
vim.keymap.set("n", "<S-H>", "<cmd>bnext<CR>", opts)
-- Save shortcut
vim.keymap.set("n", "<F12>", function()
  vim.cmd.update()
end, { noremap = true, silent = true })

-- Keymaps for vim-tmux-navigator
-- mode, key, command, options
vim.keymap.set(
  { "n", "t" },
  "<C-k>",
  "<cmd>TmuxNavigateLeft<cr>",
  { noremap = true, silent = true, desc = "Tmux Left" }
)
vim.keymap.set(
  { "n", "t" },
  "<C-h>",
  "<cmd>TmuxNavigateDown<cr>",
  { noremap = true, silent = true, desc = "Tmux Down" }
)
vim.keymap.set({ "n", "t" }, "<C-a>", "<cmd>TmuxNavigateUp<cr>", { noremap = true, silent = true, desc = "Tmux Up" })
vim.keymap.set(
  { "n", "t" },
  "<C-e>",
  "<cmd>TmuxNavigateRight<cr>",
  { noremap = true, silent = true, desc = "Tmux Right" }
)
