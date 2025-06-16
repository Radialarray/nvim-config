-- Editor enhancement plugins
return {
  -- Enhanced todo comments with highlighting and navigation
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = true, -- show icons in the signs column
      sign_priority = 8, -- sign priority
      keywords = {
        FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
    },
  },
  -- Octo.nvim - GitHub integration for pull requests and issues
  {
    "pwntester/octo.nvim",
    keys = {
      { "<leader>gc", "<cmd>Octo pr create<cr>", desc = "Create PR" },
      { "<leader>gC", "<cmd>Octo issue create<cr>", desc = "Create Issue" },
      { "<leader>gO", "<cmd>Octo pr checkout<cr>", desc = "Checkout PR" },
      { "<leader>gD", "<cmd>Octo pr diff<cr>", desc = "Show PR Diff" },
      { "<leader>gF", "<cmd>Octo pr changes<cr>", desc = "Show PR Changes" },
    },
  },
  -- Git integration with signs and blame
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    enabled = true,
  },
}
