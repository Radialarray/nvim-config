-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.g.neovide_position_animation_length = 0
  vim.g.neovide_cursor_animation_length = 0.00
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_animate_command_line = false
  vim.g.neovide_scroll_animation_far_lines = 0
  vim.g.neovide_scroll_animation_length = 0.00
  vim.g.neovide_cursor_vfx_mode = "ripple"
  vim.o.guifont = "JetBrainsMonoNL Nerd Font"
  vim.keymap.set({ "n", "x" }, "<C-S-C>", '"+y', { desc = "Copy system clipboard" })
  vim.keymap.set({ "n", "x" }, "<C-S-V>", '"+p', { desc = "Paste system clipboard" })
  if vim.g.neovide == true then
    vim.api.nvim_set_keymap(
      "n",
      "<C-+>",
      ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
      { silent = true }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<C-->",
      ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
      { silent = true }
    )
    vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
  end
end

require("config.lazy")
