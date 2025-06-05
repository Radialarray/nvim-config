return {
  -- {
  --   "zbirenbaum/copilot.lua",
  --   opts = {
  --     server = {
  --       type = "binary",
  --     },
  --   },
  -- },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    enabled = false,
  },

  {
    "olimorris/codecompanion.nvim",
    opts = {},
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/mcphub.nvim",
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
  },

  {
    "echasnovski/mini.diff",
    config = function()
      local diff = require("mini.diff")
      diff.setup({
        -- Disabled by default
        source = diff.gen_source.none(),
      })
    end,
  },

  {
    "HakonHarnes/img-clip.nvim",
    opts = {
      filetypes = {
        codecompanion = {
          prompt_for_file_name = false,
          template = "[Image]($FILE_PATH)",
          use_absolute_path = true,
        },
      },
    },
  },

  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        -- add lazydev to your completion providers
        default = { "lazydev" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100, -- show at a higher priority than lsp
          },
        },
        per_filetype = {
          codecompanion = { "codecompanion" },
        },
      },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>a", group = "ai", icon = { icon = "🤖 ", color = "green" } },
          { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle (CodeCompanion)" },
          { "<leader>ap", "<cmd>CodeCompanionActions<cr>", desc = "Prompt Actions (CodeCompanion)" },
          { "<leader>aq", "<cmd>CodeCompanion<cr>", desc = "Quick Chat (CodeCompanion)" },
          { "<leader>ax", "<cmd>CodeCompanionChat fix<cr>", desc = "Fix (CodeCompanion)" },
          { "<leader>ae", "<cmd>CodeCompanionChat explain<cr>", desc = "Explain (CodeCompanion)" },
          { "<leader>ac", "<cmd>CodeCompanionChat commit<cr>", desc = "Commit (CodeCompanion)" },
        },
      },
    },
  },
}
