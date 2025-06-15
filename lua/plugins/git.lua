-- GitHub integration with Octo.nvim for pull requests and issues
return {
  -- Octo.nvim - GitHub integration for pull requests and issues
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    event = { { event = "BufReadCmd", pattern = "octo://*" } },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      picker = "snacks", -- Use snacks picker as requested
    },
    config = function(_, opts)
      require("octo").setup(opts)
      
      -- Register treesitter for octo
      vim.treesitter.language.register("markdown", "octo")
    end,
  },

  -- Simple which-key integration for requested GitHub operations
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
      spec = {
        {
          mode = { "n", "v" },
          {
            "g",
            group = "git/github",
            icon = { icon = " ", color = "orange" },
          },
          -- Requested GitHub operations
          { "gc", "<cmd>Octo pr create<cr>", desc = "Create PR" },
          { "gC", "<cmd>Octo issue create<cr>", desc = "Create Issue" },
          { "go", "<cmd>Octo pr checkout<cr>", desc = "Checkout PR" },
          { "gl", "<cmd>Octo pr commits<cr>", desc = "List PR Commits" },
          { "gd", "<cmd>Octo pr diff<cr>", desc = "Show PR Diff" },
          { "gf", "<cmd>Octo pr changes<cr>", desc = "Show PR Changes" },
        },
      },
    },
  },
}