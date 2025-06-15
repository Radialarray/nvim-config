-- Git and GitHub integration based on LazyVim Octo extra
return {
  -- GitHub integration with Octo (LazyVim default with snacks picker)
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    event = { { event = "BufReadCmd", pattern = "octo://*" } },
    opts = function()
      vim.treesitter.language.register("markdown", "octo")
      local opts = {
        enable_builtin = true,
        default_to_projects_v2 = true,
        default_merge_method = "squash",
        picker = "snacks", -- Use snacks picker as mentioned by user
      }

      -- Keep some empty windows in sessions
      vim.api.nvim_create_autocmd("ExitPre", {
        group = vim.api.nvim_create_augroup("octo_exit_pre", { clear = true }),
        callback = function(ev)
          local keep = { "octo" }
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.tbl_contains(keep, vim.bo[buf].filetype) then
              vim.bo[buf].buftype = "" -- set buftype to empty to keep the window
            end
          end
        end,
      })

      return opts
    end,
    keys = {
      -- LazyVim default keybindings
      { "gi", "<cmd>Octo issue list<cr>", desc = "List Issues (Octo)" },
      { "<leader>gI", "<cmd>Octo issue search<cr>", desc = "Search Issues (Octo)" },
      { "<leader>gp", "<cmd>Octo pr list<cr>", desc = "List PRs (Octo)" },
      { "<leader>gP", "<cmd>Octo pr search<cr>", desc = "Search PRs (Octo)" },
      { "<leader>gr", "<cmd>Octo repo list<cr>", desc = "List Repos (Octo)" },
      { "<leader>gS", "<cmd>Octo search<cr>", desc = "Search (Octo)" },

      -- Extended keybindings for PR operations
      { "<leader>gpo", "<cmd>Octo pr checkout<cr>", desc = "Checkout PR (Octo)" },
      { "<leader>gpd", "<cmd>Octo pr diff<cr>", desc = "PR Diff (Octo)" },
      { "<leader>gpc", "<cmd>Octo pr create<cr>", desc = "Create PR (Octo)" },
      { "<leader>gpm", "<cmd>Octo pr merge squash<cr>", desc = "Merge PR (Octo)" },
      { "<leader>gpf", "<cmd>Octo pr changes<cr>", desc = "PR Files (Octo)" },

      -- Extended keybindings for issues
      { "<leader>gic", "<cmd>Octo issue create<cr>", desc = "Create Issue (Octo)" },
      { "<leader>gib", "<cmd>Octo issue browser<cr>", desc = "Issue Browser (Octo)" },

      -- Octo filetype mappings (LazyVim defaults)
      { "<localleader>a", "", desc = "+assignee (Octo)", ft = "octo" },
      { "<localleader>c", "", desc = "+comment/code (Octo)", ft = "octo" },
      { "<localleader>l", "", desc = "+label (Octo)", ft = "octo" },
      { "<localleader>i", "", desc = "+issue (Octo)", ft = "octo" },
      { "<localleader>r", "", desc = "+react (Octo)", ft = "octo" },
      { "<localleader>p", "", desc = "+pr (Octo)", ft = "octo" },
      { "<localleader>pr", "", desc = "+rebase (Octo)", ft = "octo" },
      { "<localleader>ps", "", desc = "+squash (Octo)", ft = "octo" },
      { "<localleader>v", "", desc = "+review (Octo)", ft = "octo" },
      { "<localleader>g", "", desc = "+goto_issue (Octo)", ft = "octo" },
      { "@", "@<c-x><c-o>", mode = "i", ft = "octo", silent = true },
      { "#", "#<c-x><c-o>", mode = "i", ft = "octo", silent = true },
    },
  },

  -- Extended which-key menu for git/github operations
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>g", group = "git/github", icon = { icon = " ", color = "orange" } },
          
          -- Pull Request sub-menu
          { "<leader>gp", group = "pull requests", icon = { icon = " ", color = "blue" } },
          
          -- Issues sub-menu  
          { "<leader>gi", group = "issues", icon = { icon = " ", color = "red" } },
          
          -- Repository sub-menu
          { "<leader>gr", group = "repos", icon = { icon = " ", color = "green" } },
        },
      },
    },
  },
}
