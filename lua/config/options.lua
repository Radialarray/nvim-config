-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Editor appearance and behavior
vim.opt.relativenumber = true -- Show relative line numbers for easier navigation

-- Performance optimizations
vim.g.snacks_animate = false -- Disable snacks animations for better performance

vim.keymap.set({ "n", "v" }, "<C-S-A>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
