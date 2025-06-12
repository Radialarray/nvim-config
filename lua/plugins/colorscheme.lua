return {
  { "projekt0n/github-nvim-theme", name = "github-theme" },
  { "lunacookies/vim-colors-xcode", name = "xcode-theme" },
  {
    "marko-cerovac/material.nvim",
    name = "material-theme",
  },
  -- Configure LazyVim to load theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_dark_default",
    },
  },
}
