-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Editor appearance and behavior
vim.opt.relativenumber = true -- Show relative line numbers for easier navigation

-- Performance optimizations
vim.g.snacks_animate = false -- Disable snacks animations for better performance

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
