-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymap
local opts = { noremap = true, silent = true }
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
--vim.keymap.set("n", "<localleader>", '<cmd>lua require("which-key").show("\\\\")<cr>')
vim.keymap.set("n", "<Return>", "o<Esc>", { desc = "New line in normal mode" })
-- remap nav keys for akl
vim.keymap.set({ "n", "x" }, "k", "h", { noremap = true, desc = "Left" })
vim.keymap.set({ "n", "x" }, "h", "j", { noremap = true, desc = "Down" })
vim.keymap.set({ "n", "x" }, "a", "k", { noremap = true, desc = "Up" })
vim.keymap.set({ "n", "x" }, "e", "l", { noremap = true, desc = "Right" })
vim.keymap.set({ "n", "x" }, "j", "e", { noremap = true, desc = "Next end of word" })
vim.keymap.set({ "n", "x" }, "l", "a", { noremap = true, desc = "Around" })
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
vim.keymap.set("n", "<S-A>", "<cmd>keepjumps bprevious<CR>", opts)
vim.keymap.set("n", "<S-H>", "<cmd>keepjumps bnext<CR>", opts)
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

vim.keymap.set("x", "p", "<Plug>(YankyPutBefore)", { desc = "Paste without copying replaced text" })
-- Inspect lua table contents
P = function(v)
  print(vim.inspect(v))
  return v
end

-- Toggle bool
vim.keymap.set("n", "gtt", function()
  local word = vim.fn.expand("<cword>")
  if word == "true" then
    vim.cmd("normal! ciwfalse")
  elseif word == "false" then
    vim.cmd("normal! ciwtrue")
  elseif word == "True" then
    vim.cmd("normal! ciwFalse")
  elseif word == "False" then
    vim.cmd("normal! ciwTrue")
  end
end, { desc = "Toggle boolean under cursor" })
-- Toggle next boolean
vim.keymap.set("n", "gtn", function()
  -- Whole-word, case-sensitive boolean pattern.
  local pattern = [[\C\<\%(true\|false\|True\|False\)\>]]

  -- Preserve the last search register.
  local old_search = vim.fn.getreg("/")

  -- "W" means: do not wrap around the end of the file.
  -- Use "w" instead if you want wrapping.
  -- Add "c" if you also want to match a boolean directly under the cursor.
  if vim.fn.search(pattern, "W") == 0 then
    vim.fn.setreg("/", old_search)
    vim.notify("No next boolean found", vim.log.levels.INFO)
    return
  end
  local word = vim.fn.expand("<cword>")
  if word == "true" then
    vim.cmd("normal! ciwfalse")
  elseif word == "false" then
    vim.cmd("normal! ciwtrue")
  elseif word == "True" then
    vim.cmd("normal! ciwFalse")
  elseif word == "False" then
    vim.cmd("normal! ciwTrue")
  end
end, { desc = "Go to next boolean and toggle it" })
