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
        FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } }, -- nf-fa-bug
        TODO = { icon = " ", color = "info" }, -- nf-fa-check
        HACK = { icon = " ", color = "warning" }, -- nf-oct-beaker
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } }, -- nf-fa-warning
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } }, -- nf-md-speedometer
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } }, -- nf-md-note
        TEST = { icon = " ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } }, -- nf-oct-watch
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
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
