-- AI and coding assistance plugins
return {
  -- Disable CopilotChat in favor of CodeCompanion
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    enabled = false,
  },

  -- GitHub Copilot integration
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    config = function()
      require("copilot").setup({
        server = {
          type = "binary", -- Use the binary version for better performance
        },
      })
    end,
  },

  -- Model Context Protocol Hub for external tool integration
  {
    "ravitemer/mcphub.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "MCPHub",
    build = "bundled_build.lua",
    config = function()
      require("mcphub").setup({
        use_bundled_binary = true,
        port = 6543,
        config = vim.fn.expand("~/.config/mcphub/servers.json"),
        log = {
          level = vim.log.levels.WARN,
          to_file = false,
          file_path = nil,
          prefix = "MCPHub",
        },
        auto_approve = true,
        extensions = {
          code_companion = {
            show_result_in_chat = true,
            make_vars = true,
          },
        },
      })
    end,
  },

  -- AI-powered coding assistant and chat interface
  {
    "olimorris/codecompanion.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/codecompanion-history.nvim",
    },
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = { adapter = "copilot" },
          inline = { adapter = "copilot" },
          cmd = { adapter = "copilot" },
        },
        adapters = {
          opts = {
            show_model_choices = true,
            show_defaults = false,
          },
        },
        extensions = {
          history = {
            enabled = true,
            opts = {
              keymap = "gh", -- Keymap to open history from chat buffer
              save_chat_keymap = "sc", -- Keymap to save the current chat manually
              auto_save = true, -- Save all chats by default
              expiration_days = 0, -- Number of days after which chats are deleted (0 to disable)
              picker = "snacks", -- Picker interface (telescope, snacks, fzf-lua, or default)
              auto_generate_title = true, -- Automatically generate titles for new chats
              title_generation_opts = {
                adapter = nil, -- Adapter for generating titles (defaults to current chat adapter)
                model = nil, -- Model for generating titles (defaults to current chat model)
                refresh_every_n_prompts = 0, -- Number of user prompts after which to refresh the title
                max_refreshes = 3, -- Maximum number of times to refresh the title
              },
              continue_last_chat = false, -- Load the last chat on opening chat
              delete_on_clearing_chat = false, -- Delete chat from history when cleared with gx
              dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
              enable_logging = false, -- Enable detailed logging for history extension
            },
          },
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              show_result_in_chat = true, -- Show mcp tool results in chat
              make_vars = true, -- Convert resources to #variables
              make_slash_commands = true, -- Add prompts as /slash commands
            },
          },
        },
      })

      -- Auto-focus chat window and enter insert mode when opened
      local group = vim.api.nvim_create_augroup("CodeCompanionHooks", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        pattern = "CodeCompanionChatOpened",
        group = group,
        callback = function(event)
          local buf = event.buf
          vim.api.nvim_set_current_buf(buf)
          vim.api.nvim_win_set_cursor(0, { vim.api.nvim_buf_line_count(buf), 0 })
          vim.cmd("startinsert")
        end,
      })
    end,
  },

  -- Enhanced markdown rendering for AI chats
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
    opts = {
      code = { sign = true, width = "block", right_pad = 1 },
      heading = {
        sign = true,
        setext = false,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
      checkbox = { enabled = true },
    },
  },

  -- Minimal diff visualization (disabled by default)
  {
    "echasnovski/mini.diff",
    config = function()
      local diff = require("mini.diff")
      diff.setup({
        source = diff.gen_source.none(), -- Disabled by default
      })
    end,
  },

  -- Image clipboard integration for markdown files
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

  -- Enhanced completion with AI integration
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        default = { "lazydev" }, -- Add lazydev to completion providers
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100, -- Show at higher priority than LSP
          },
        },
        per_filetype = {
          codecompanion = { "codecompanion" }, -- AI completion for codecompanion
        },
      },
    },
  },

  -- AI-related keybindings and which-key integration
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
      spec = {
        {
          mode = { "n", "v" },
          {
            "<leader>a",
            group = "ai",
            icon = { icon = "🤖 ", color = "green" },
          },
          -- AI Chat Commands
          { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle Chat" },
          { "<leader>ap", "<cmd>CodeCompanionActions<cr>", desc = "Prompt Actions" },
          { "<leader>aq", "<cmd>CodeCompanion<cr>", desc = "Quick Chat" },
          { "<leader>ax", "<cmd>CodeCompanionChat fix<cr>", desc = "Fix Code" },
          { "<leader>ae", "<cmd>CodeCompanionChat explain<cr>", desc = "Explain Code" },
          { "<leader>ac", "<cmd>CodeCompanionChat commit<cr>", desc = "Generate Commit" },
          { "<leader>ah", "<cmd>CodeCompanionHistory<cr>", desc = "Chat History" },
        },
      },
    },
  },
}
