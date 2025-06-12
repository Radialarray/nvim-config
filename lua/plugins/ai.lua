return { -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   opts = function()
  --     return {
  --       providers = {
  --         -- insert provider dictionary entries here
  --         ollama = {
  --           prepare_input = require("CopilotChat.config.providers").copilot.prepare_input,
  --           prepare_output = require("CopilotChat.config.providers").copilot.prepare_output,
  --
  --           get_models = function(headers)
  --             local response, err = require("CopilotChat.utils").curl_get("http://localhost:11434/v1/models", {
  --               headers = headers,
  --               json_response = true,
  --             })
  --
  --             if err then
  --               error(err)
  --             end
  --
  --             return vim.tbl_map(function(model)
  --               return {
  --                 id = model.id,
  --                 name = model.id,
  --               }
  --             end, response.body.data)
  --           end,
  --
  --           embed = function(inputs, headers)
  --             local response, err = require("CopilotChat.utils").curl_post("http://localhost:11434/v1/embeddings", {
  --               headers = headers,
  --               json_request = true,
  --               json_response = true,
  --               body = {
  --                 input = inputs,
  --                 model = "all-minilm",
  --               },
  --             })
  --
  --             if err then
  --               error(err)
  --             end
  --
  --             return response.body.data
  --           end,
  --
  --           get_url = function()
  --             return "http://localhost:11434/v1/chat/completions"
  --           end,
  --         },
  --       },
  --     }
  --   end,
  -- },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    enabled = false,
  },
  {
    "zbirenbaum/copilot.lua",
    enabled = true,
    cmd = "Copilot",
    config = function()
      require("copilot").setup({
        server = {
          type = "binary",
        },
      })
    end,
  },
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
  {
    "olimorris/codecompanion.nvim",
    opts = {},
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/codecompanion-history.nvim",
    },
    config = function(_, opts)
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "copilot",
          },
          inline = {
            adapter = "copilot",
          },
          cmd = {
            adapter = "copilot",
          },
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
              -- Keymap to open history from chat buffer (default: gh)
              keymap = "gh",
              -- Keymap to save the current chat manually (when auto_save is disabled)
              save_chat_keymap = "sc",
              -- Save all chats by default (disable to save only manually using 'sc')
              auto_save = true,
              -- Number of days after which chats are automatically deleted (0 to disable)
              expiration_days = 0,
              -- Picker interface (auto resolved to a valid picker)
              picker = "snacks", --- ("telescope", "snacks", "fzf-lua", or "default")
              ---Automatically generate titles for new chats
              auto_generate_title = true,
              title_generation_opts = {
                ---Adapter for generating titles (defaults to current chat adapter)
                adapter = nil, -- "copilot"
                ---Model for generating titles (defaults to current chat model)
                model = nil, -- "gpt-4o"
                ---Number of user prompts after which to refresh the title (0 to disable)
                refresh_every_n_prompts = 0, -- e.g., 3 to refresh after every 3rd user prompt
                ---Maximum number of times to refresh the title (default: 3)
                max_refreshes = 3,
              },
              ---On exiting and entering neovim, loads the last chat on opening chat
              continue_last_chat = false,
              ---When chat is cleared with `gx` delete the chat from history
              delete_on_clearing_chat = false,
              ---Directory path to save the chats
              dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
              ---Enable detailed logging for history extension
              enable_logging = false,
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
      local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {
        clear = true,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "CodeCompanionChatOpened",
        group = group,
        callback = function(event)
          local buf = event.buf
          vim.api.nvim_set_current_buf(buf)
          vim.api.nvim_win_set_cursor(0, { vim.api.nvim_buf_line_count(buf), 0 }) -- go to bottom
          vim.cmd("startinsert")
        end,
      })
    end,
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
          {
            "<leader>a",
            group = "ai",
            icon = {
              icon = "🤖 ",
              color = "green",
            },
          },
          {
            "<leader>aa",
            "<cmd>CodeCompanionChat Toggle<cr>",
            desc = "Toggle (CodeCompanion)",
          },
          {
            "<leader>ap",
            "<cmd>CodeCompanionActions<cr>",
            desc = "Prompt Actions (CodeCompanion)",
          },
          {
            "<leader>aq",
            "<cmd>CodeCompanion<cr>",
            desc = "Quick Chat (CodeCompanion)",
          },
          {
            "<leader>ax",
            "<cmd>CodeCompanionChat fix<cr>",
            desc = "Fix (CodeCompanion)",
          },
          {
            "<leader>ae",
            "<cmd>CodeCompanionChat explain<cr>",
            desc = "Explain (CodeCompanion)",
          },
          {
            "<leader>ac",
            "<cmd>CodeCompanionChat commit<cr>",
            desc = "Commit (CodeCompanion)",
          },
          {
            "<leader>ah",
            "<cmd>CodeCompanionHistory<cr>",
            desc = "History (CodeCompanion)",
          },
        },
      },
    },
  },
  -- {
  --     "yetone/avante.nvim",
  --     event = "VeryLazy",
  --     version = false, -- Never set this value to "*"! Never!
  --     opts = {
  --         -- add any opts here
  --         -- for example
  --         provider = "ollama",
  --         providers = {
  --             ollama = {
  --                 endpoint = "http://localhost:11434"
  --             }
  --         },
  --         auto_suggestions_provider = "copilot",
  --         windows = {
  --             width = 25, -- default % based on available width
  --             sidebar_header = {
  --                 enabled = true, -- true, false to enable/disable the header
  --                 align = "left", -- left, center, right for title
  --                 rounded = false
  --             }
  --         }
  --     },
  --     -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --     build = "make",
  --     -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --     dependencies = {"nvim-treesitter/nvim-treesitter", "stevearc/dressing.nvim", "nvim-lua/plenary.nvim",
  --                     "MunifTanjim/nui.nvim", --- The below dependencies are optional,
  --     "echasnovski/mini.pick", -- for file_selector provider mini.pick
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --     "ibhagwan/fzf-lua", -- for file_selector provider fzf
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --         -- support for image pasting
  --         "HakonHarnes/img-clip.nvim",
  --         event = "VeryLazy",
  --         opts = {
  --             -- recommended settings
  --             default = {
  --                 embed_image_as_base64 = false,
  --                 prompt_for_file_name = false,
  --                 drag_and_drop = {
  --                     insert_mode = true
  --                 },
  --                 -- required for Windows users
  --                 use_absolute_path = true
  --             }
  --         }
  --     }, {
  --         -- Make sure to set this up properly if you have lazy=true
  --         "MeanderingProgrammer/render-markdown.nvim",
  --         opts = {
  --             file_types = {"markdown", "Avante"}
  --         },
  --         ft = {"markdown", "Avante"}
  --     }
  --   }
  -- }
}
