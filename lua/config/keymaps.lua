-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "i", "v" }, "ö", "[", { remap = true })
vim.keymap.set({ "n", "i", "v" }, "ä", "]", { remap = true })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })

vim.keymap.set({ "n", "v" }, "<C-S-A>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
