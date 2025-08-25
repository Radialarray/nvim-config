-- Multiple cursor functionality
-- Enhanced multiple cursor editing with hydra-based keybindings
return {
  -- Main multicursor plugin
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = { "nvimtools/hydra.nvim" },
    opts = {}, -- Use default configuration
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<Leader>m",
        "<cmd>MCstart<cr>",
        desc = "Create multicursor selection",
      },
    },
  },

  -- Enhanced keybindings for multicursor operations
  {
    "folke/which-key.nvim",
    opts_extend = { "spec" },
    opts = {
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>m", group = "multicursor", icon = { icon = "🖱️", color = "magenta" } },
          {
            "<leader>ma",
            function()
              vim.cmd("MCstart")
              vim.defer_fn(function()
                vim.api.nvim_input("<C-a>") -- Select all matches
              end, 50)
            end,
            desc = "Select all matches",
          },
        },
      },
    },
  },
}
