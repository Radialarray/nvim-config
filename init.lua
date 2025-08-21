-- LazyVim Configuration Entry Point
-- Optimizes Neovide GUI settings and loads LazyVim configuration

-- Neovide GUI-specific optimizations and settings
if vim.g.neovide then
  -- Disable all animations for better performance
  vim.g.neovide_position_animation_length = 0
  vim.g.neovide_cursor_animation_length = 0.00
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_animate_command_line = false
  vim.g.neovide_scroll_animation_far_lines = 0
  vim.g.neovide_scroll_animation_length = 0.00

  -- Interprets Alt + whatever actually as <M-whatever>, instead of sending the actual special character to Neovim.
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"

  -- Cursor visual effects
  -- vim.g.neovide_cursor_vfx_mode = "ripple"

  -- Font configuration
  vim.o.guifont = "JetbrainsMonoNL Nerd Font"
  vim.g.neovide_text_gamma = 0.9
  vim.g.neovide_text_contrast = 0.1
  -- System clipboard integration
  vim.keymap.set({ "n", "x" }, "<C-S-C>", '"+y', { desc = "Copy to system clipboard" })
  vim.keymap.set({ "n", "x" }, "<C-S-V>", '"+p', { desc = "Paste from system clipboard" })
  vim.keymap.set("i", "<C-S-V>", "<C-R>+", { desc = "Paste from system clipboard in insert mode" })
  -- Zoom controls for Neovide
  if vim.g.neovide == true then
    vim.api.nvim_set_keymap(
      "n",
      "<C-+>",
      ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
      { silent = true, desc = "Zoom in" }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<C-->",
      ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
      { silent = true, desc = "Zoom out" }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<C-0>",
      ":lua vim.g.neovide_scale_factor = 1<CR>",
      { silent = true, desc = "Reset zoom" }
    )
  end
end

-- Load LazyVim configuration
require("config.lazy")
