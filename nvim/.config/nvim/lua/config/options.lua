-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.maplocalleader = ","
vim.opt.relativenumber = false
vim.opt.cpoptions:append("I")
vim.opt.numberwidth = 1
vim.g.molten_image_provider = "image.nvim"
vim.opt.number = false
vim.opt.statuscolumn = "%s"
vim.opt.signcolumn = "yes:1"
vim.g.lazyvim_python_lsp = "basedpyright"

-- vim.opt.foldcolumn = "0" -- Completely disable the fold column
