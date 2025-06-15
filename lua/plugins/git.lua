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
    opts = function()
      -- Configure picker based on available options
      local picker = "snacks" -- Default to snacks as requested by user
      
      return {
        enable_builtin = true,
        default_to_projects_v2 = true,
        default_merge_method = "squash",
        picker = picker,
        use_local_fs = false,
        suppress_missing_scope = {
          projects_v2 = true,
        },
        -- GitHub Enterprise support
        github_hostname = "", -- Set to your GHE hostname if using GitHub Enterprise
        -- User mappings
        mappings = {
          issue = {
            close_issue = { lhs = "<space>ic", desc = "close issue" },
            reopen_issue = { lhs = "<space>io", desc = "reopen issue" },
            list_issues = { lhs = "<space>il", desc = "list open issues on same repo" },
            reload = { lhs = "<C-r>", desc = "reload issue" },
            open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
            copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
            add_assignee = { lhs = "<space>aa", desc = "add assignee" },
            remove_assignee = { lhs = "<space>ad", desc = "remove assignee" },
            create_label = { lhs = "<space>lc", desc = "create label" },
            add_label = { lhs = "<space>la", desc = "add label" },
            remove_label = { lhs = "<space>ld", desc = "remove label" },
            goto_issue = { lhs = "<space>gi", desc = "navigate to a local repo issue" },
            add_comment = { lhs = "<space>ca", desc = "add comment" },
            delete_comment = { lhs = "<space>cd", desc = "delete comment" },
            next_comment = { lhs = "]c", desc = "go to next comment" },
            prev_comment = { lhs = "[c", desc = "go to previous comment" },
            react_hooray = { lhs = "<space>rp", desc = "add/remove 🎉 reaction" },
            react_heart = { lhs = "<space>rh", desc = "add/remove ❤️ reaction" },
            react_eyes = { lhs = "<space>re", desc = "add/remove 👀 reaction" },
            react_thumbs_up = { lhs = "<space>r+", desc = "add/remove 👍 reaction" },
            react_thumbs_down = { lhs = "<space>r-", desc = "add/remove 👎 reaction" },
            react_rocket = { lhs = "<space>rr", desc = "add/remove 🚀 reaction" },
            react_laugh = { lhs = "<space>rl", desc = "add/remove 😄 reaction" },
            react_confused = { lhs = "<space>rc", desc = "add/remove 😕 reaction" },
          },
          pull_request = {
            checkout_pr = { lhs = "<space>po", desc = "checkout PR" },
            merge_pr = { lhs = "<space>pm", desc = "merge commit PR" },
            squash_and_merge_pr = { lhs = "<space>psm", desc = "squash and merge PR" },
            rebase_and_merge_pr = { lhs = "<space>prm", desc = "rebase and merge PR" },
            list_commits = { lhs = "<space>pc", desc = "list PR commits" },
            list_changed_files = { lhs = "<space>pf", desc = "list PR changed files" },
            show_pr_diff = { lhs = "<space>pd", desc = "show PR diff" },
            add_reviewer = { lhs = "<space>va", desc = "add reviewer" },
            remove_reviewer = { lhs = "<space>vd", desc = "remove reviewer request" },
            close_pr = { lhs = "<space>pc", desc = "close PR" },
            reopen_pr = { lhs = "<space>po", desc = "reopen PR" },
            list_prs = { lhs = "<space>pl", desc = "list open PRs on same repo" },
            reload = { lhs = "<C-r>", desc = "reload PR" },
            open_in_browser = { lhs = "<C-b>", desc = "open PR in browser" },
            copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
            goto_file = { lhs = "gf", desc = "go to file" },
            add_assignee = { lhs = "<space>aa", desc = "add assignee" },
            remove_assignee = { lhs = "<space>ad", desc = "remove assignee" },
            create_label = { lhs = "<space>lc", desc = "create label" },
            add_label = { lhs = "<space>la", desc = "add label" },
            remove_label = { lhs = "<space>ld", desc = "remove label" },
            goto_issue = { lhs = "<space>gi", desc = "navigate to a local repo issue" },
            add_comment = { lhs = "<space>ca", desc = "add comment" },
            delete_comment = { lhs = "<space>cd", desc = "delete comment" },
            next_comment = { lhs = "]c", desc = "go to next comment" },
            prev_comment = { lhs = "[c", desc = "go to previous comment" },
            react_hooray = { lhs = "<space>rp", desc = "add/remove 🎉 reaction" },
            react_heart = { lhs = "<space>rh", desc = "add/remove ❤️ reaction" },
            react_eyes = { lhs = "<space>re", desc = "add/remove 👀 reaction" },
            react_thumbs_up = { lhs = "<space>r+", desc = "add/remove 👍 reaction" },
            react_thumbs_down = { lhs = "<space>r-", desc = "add/remove 👎 reaction" },
            react_rocket = { lhs = "<space>rr", desc = "add/remove 🚀 reaction" },
            react_laugh = { lhs = "<space>rl", desc = "add/remove 😄 reaction" },
            react_confused = { lhs = "<space>rc", desc = "add/remove 😕 reaction" },
            review_start = { lhs = "<space>vs", desc = "start a review for the current PR" },
            review_resume = { lhs = "<space>vr", desc = "resume a pending review for the current PR" },
          },
          review_thread = {
            goto_issue = { lhs = "<space>gi", desc = "navigate to a local repo issue" },
            add_comment = { lhs = "<space>ca", desc = "add comment" },
            add_suggestion = { lhs = "<space>sa", desc = "add suggestion" },
            delete_comment = { lhs = "<space>cd", desc = "delete comment" },
            next_comment = { lhs = "]c", desc = "go to next comment" },
            prev_comment = { lhs = "[c", desc = "go to previous comment" },
            select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
            select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
            close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
            react_hooray = { lhs = "<space>rp", desc = "add/remove 🎉 reaction" },
            react_heart = { lhs = "<space>rh", desc = "add/remove ❤️ reaction" },
            react_eyes = { lhs = "<space>re", desc = "add/remove 👀 reaction" },
            react_thumbs_up = { lhs = "<space>r+", desc = "add/remove 👍 reaction" },
            react_thumbs_down = { lhs = "<space>r-", desc = "add/remove 👎 reaction" },
            react_rocket = { lhs = "<space>rr", desc = "add/remove 🚀 reaction" },
            react_laugh = { lhs = "<space>rl", desc = "add/remove 😄 reaction" },
            react_confused = { lhs = "<space>rc", desc = "add/remove 😕 reaction" },
          },
          submit_win = {
            approve_review = { lhs = "<C-a>", desc = "approve review" },
            comment_review = { lhs = "<C-m>", desc = "comment review" },
            request_changes = { lhs = "<C-r>", desc = "request changes review" },
            close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
          },
          review_diff = {
            submit_review = { lhs = "<leader>vs", desc = "submit review" },
            discard_review = { lhs = "<leader>vd", desc = "discard review" },
            add_review_comment = { lhs = "<space>ca", desc = "add a new review comment" },
            add_review_suggestion = { lhs = "<space>sa", desc = "add a new review suggestion" },
            focus_files = { lhs = "<leader>e", desc = "move focus to changed file panel" },
            toggle_files = { lhs = "<leader>b", desc = "hide/show changed files panel" },
            next_thread = { lhs = "]t", desc = "move to next thread" },
            prev_thread = { lhs = "[t", desc = "move to previous thread" },
            select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
            select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
            close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
            toggle_viewed = { lhs = "<leader><space>", desc = "toggle viewer viewed state" },
            goto_file = { lhs = "gf", desc = "go to file" },
          },
          file_panel = {
            next_entry = { lhs = "j", desc = "move to next changed file" },
            prev_entry = { lhs = "k", desc = "move to previous changed file" },
            select_entry = { lhs = "<cr>", desc = "show selected changed file diffs" },
            refresh_files = { lhs = "R", desc = "refresh changed files panel" },
            focus_files = { lhs = "<leader>e", desc = "move focus to changed file panel" },
            toggle_files = { lhs = "<leader>b", desc = "hide/show changed files panel" },
            select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
            select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
            close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
            toggle_viewed = { lhs = "<leader><space>", desc = "toggle viewer viewed state" },
          },
        },
      }
    end,
    config = function(_, opts)
      require("octo").setup(opts)
      
      -- Register treesitter for octo
      vim.treesitter.language.register("markdown", "octo")

      -- Keep some empty windows in sessions
      vim.api.nvim_create_autocmd("ExitPre", {
        group = vim.api.nvim_create_augroup("octo_exit_pre", { clear = true }),
        callback = function()
          local keep = { "octo" }
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.tbl_contains(keep, vim.bo[buf].filetype) then
              vim.bo[buf].buftype = "" -- set buftype to empty to keep the window
            end
          end
        end,
      })
    end,
  },

  -- Enhanced which-key integration for comprehensive GitHub operations
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
          -- Basic GitHub operations
          { "gi", "<cmd>Octo issue list<cr>", desc = "List Issues (Octo)" },
          { "gI", "<cmd>Octo issue search<cr>", desc = "Search Issues (Octo)" },
          { "gp", "<cmd>Octo pr list<cr>", desc = "List PRs (Octo)" },
          { "gP", "<cmd>Octo pr search<cr>", desc = "Search PRs (Octo)" },
          { "gr", "<cmd>Octo repo list<cr>", desc = "List Repos (Octo)" },
          { "gS", "<cmd>Octo search<cr>", desc = "Search (Octo)" },
          
          -- Extended GitHub operations
          { "gc", "<cmd>Octo pr create<cr>", desc = "Create PR" },
          { "gC", "<cmd>Octo issue create<cr>", desc = "Create Issue" },
          { "go", "<cmd>Octo pr checkout<cr>", desc = "Checkout PR" },
          { "gm", "<cmd>Octo pr merge<cr>", desc = "Merge PR" },
          { "gd", "<cmd>Octo pr diff<cr>", desc = "Show PR Diff" },
          { "gf", "<cmd>Octo pr changes<cr>", desc = "Show PR Changed Files" },
          { "gb", "<cmd>Octo pr browser<cr>", desc = "Open PR in Browser" },
          { "gB", "<cmd>Octo issue browser<cr>", desc = "Open Issue in Browser" },
          
          -- Review operations
          { "gv", group = "review" },
          { "gvs", "<cmd>Octo review start<cr>", desc = "Start Review" },
          { "gvr", "<cmd>Octo review resume<cr>", desc = "Resume Review" },
          { "gvc", "<cmd>Octo review commit<cr>", desc = "Review Commit" },
          { "gvd", "<cmd>Octo review discard<cr>", desc = "Discard Review" },
          
          -- Advanced operations
          { "gt", group = "tasks" },
          { "gta", "<cmd>Octo assignee add<cr>", desc = "Add Assignee" },
          { "gtd", "<cmd>Octo assignee remove<cr>", desc = "Remove Assignee" },
          { "gtl", "<cmd>Octo label add<cr>", desc = "Add Label" },
          { "gtL", "<cmd>Octo label remove<cr>", desc = "Remove Label" },
          { "gtr", "<cmd>Octo reviewer add<cr>", desc = "Add Reviewer" },
          { "gtR", "<cmd>Octo reviewer remove<cr>", desc = "Remove Reviewer" },
          
          -- Comment operations
          { "gn", group = "comments" },
          { "gna", "<cmd>Octo comment add<cr>", desc = "Add Comment" },
          { "gnd", "<cmd>Octo comment delete<cr>", desc = "Delete Comment" },
          { "gnn", "<cmd>Octo comment next<cr>", desc = "Next Comment" },
          { "gnp", "<cmd>Octo comment prev<cr>", desc = "Previous Comment" },
          
          -- Repository operations
          { "gR", group = "repository" },
          { "gRf", "<cmd>Octo repo fork<cr>", desc = "Fork Repository" },
          { "gRu", "<cmd>Octo repo url<cr>", desc = "Copy Repository URL" },
          { "gRb", "<cmd>Octo repo browser<cr>", desc = "Open Repository in Browser" },
          
          -- Action operations (for bulk operations)
          { "gA", group = "actions" },
          { "gAo", function()
            -- Open all changed files in current PR
            vim.cmd("Octo pr changes")
            vim.defer_fn(function()
              -- This will be called after the files are listed
              vim.cmd("normal! ggVG") -- Select all
              vim.cmd("'<,'>normal gf") -- Open files under cursor
            end, 500)
          end, desc = "Open All Changed Files" },
          { "gAd", function()
            -- Show diff for all changed files
            vim.cmd("Octo pr diff")
          end, desc = "Show All Diffs" },
          { "gAc", function()
            -- Checkout PR and show summary
            vim.ui.input({ prompt = "PR number: " }, function(pr_number)
              if pr_number then
                vim.cmd("Octo pr checkout " .. pr_number)
                vim.defer_fn(function()
                  vim.cmd("Octo pr diff")
                end, 1000)
              end
            end)
          end, desc = "Checkout & Review PR" },
        },
        
        -- Octo filetype specific mappings
        {
          mode = { "n", "v" },
          ft = "octo",
          { "<localleader>a", "", desc = "+assignee (Octo)" },
          { "<localleader>c", "", desc = "+comment/code (Octo)" },
          { "<localleader>l", "", desc = "+label (Octo)" },
          { "<localleader>i", "", desc = "+issue (Octo)" },
          { "<localleader>r", "", desc = "+react (Octo)" },
          { "<localleader>p", "", desc = "+pr (Octo)" },
          { "<localleader>pr", "", desc = "+rebase (Octo)" },
          { "<localleader>ps", "", desc = "+squash (Octo)" },
          { "<localleader>v", "", desc = "+review (Octo)" },
          { "<localleader>g", "", desc = "+goto_issue (Octo)" },
          { "@", "@<c-x><c-o>", mode = "i", silent = true },
          { "#", "#<c-x><c-o>", mode = "i", silent = true },
        },
      },
    },
  },
}