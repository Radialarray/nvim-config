-- Colorscheme configuration
return {
  -- Additional colorscheme options
  { "projekt0n/github-nvim-theme", name = "github-theme" },
  { "lunacookies/vim-colors-xcode", name = "xcode-theme" },
  { "marko-cerovac/material.nvim", name = "material-theme" },

  -- Set the active colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_dark_default", -- Dark GitHub theme
    },
  },
}
