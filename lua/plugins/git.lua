-- Git and GitHub integration plugins
return {
  -- GitHub integration with Octo
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Octo",
    config = function()
      require("octo").setup({
        use_local_fs = false, -- use local files on right side of reviews
        enable_builtin = true, -- shows a list of builtin actions when no action is provided
        default_remote = { "upstream", "origin" }, -- order to try remotes
        default_merge_method = "commit", -- default merge method which should be used when calling `Octo pr merge`, could be `commit`, `rebase` or `squash`
        ssh_aliases = {}, -- SSH aliases. e.g. `ssh_aliases = {["github.com-work"] = "github.com"}`
        reaction_viewer_hint_icon = "", -- marker for user reactions
        user_icon = " ", -- user icon
        timeline_marker = "", -- timeline marker
        timeline_indent = "2", -- timeline indentation
        right_bubble_delimiter = "", -- bubble delimiter
        left_bubble_delimiter = "", -- bubble delimiter
        github_hostname = "", -- GitHub Enterprise host
        snippet_context_lines = 4, -- number or lines around commented lines
        gh_env = {}, -- extra environment variables to pass on to GitHub CLI, can be a table or function returning a table
        timeout = 5000, -- timeout for requests between the remote server
        ui = {
          use_signcolumn = true, -- show "modified" marks on the sign column
        },
        issues = {
          order_by = { -- criteria to sort results of `Octo issue list`
            field = "CREATED_AT", -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
            direction = "DESC", -- either ASC or DESC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
          },
        },
        pull_requests = {
          order_by = { -- criteria to sort the results of `Octo pr list`
            field = "CREATED_AT", -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
            direction = "DESC", -- either ASC or DESC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
          },
          always_select_remote_on_create = false, -- always give prompt to select base remote repo when creating PRs
        },
        file_panel = {
          size = 10, -- changed files panel rows
          use_icons = true, -- use web-devicons in file panel (if false, nvim-web-devicons does not need to be installed)
        },
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
            list_commits = { lhs = "<space>pc", desc = "list PR commits" },
            list_changed_files = { lhs = "<space>pf", desc = "list PR changed files" },
            show_pr_diff = { lhs = "<space>pd", desc = "show PR diff" },
            add_reviewer = { lhs = "<space>va", desc = "add reviewer" },
            remove_reviewer = { lhs = "<space>vd", desc = "remove reviewer request" },
            close_issue = { lhs = "<space>ic", desc = "close PR" },
            reopen_issue = { lhs = "<space>io", desc = "reopen PR" },
            list_issues = { lhs = "<space>il", desc = "list open issues on same repo" },
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
      })
    end,
  },

  -- Git and GitHub keybindings with which-key integration
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
      spec = {
        {
          mode = { "n", "v" },
          {
            "<leader>g",
            group = "git/github",
            icon = { icon = " ", color = "orange" },
          },

          -- Pull Request operations
          {
            "<leader>gp",
            group = "pull requests",
            icon = { icon = " ", color = "blue" },
          },
          { "<leader>gpl", "<cmd>Octo pr list<cr>", desc = "List PRs" },
          { "<leader>gpc", "<cmd>Octo pr create<cr>", desc = "Create PR" },
          { "<leader>gpo", "<cmd>Octo pr checkout<cr>", desc = "Checkout PR" },
          { "<leader>gpr", "<cmd>Octo pr ready<cr>", desc = "Mark PR ready" },
          { "<leader>gpd", "<cmd>Octo pr diff<cr>", desc = "Show PR diff" },
          { "<leader>gpm", "<cmd>Octo pr merge commit<cr>", desc = "Merge PR (commit)" },
          { "<leader>gps", "<cmd>Octo pr merge squash<cr>", desc = "Squash & merge PR" },
          { "<leader>gpb", "<cmd>Octo pr merge rebase<cr>", desc = "Rebase & merge PR" },
          { "<leader>gpf", "<cmd>Octo pr changes<cr>", desc = "Show changed files" },
          { "<leader>gpt", "<cmd>Octo pr commits<cr>", desc = "Show commits" },
          { "<leader>gpe", "<cmd>Octo pr edit<cr>", desc = "Edit PR" },
          { "<leader>gpx", "<cmd>Octo pr close<cr>", desc = "Close PR" },
          { "<leader>gpu", "<cmd>Octo pr reopen<cr>", desc = "Reopen PR" },
          { "<leader>gpv", "<cmd>Octo pr browser<cr>", desc = "Open PR in browser" },

          -- Issue operations
          {
            "<leader>gi",
            group = "issues",
            icon = { icon = " ", color = "red" },
          },
          { "<leader>gil", "<cmd>Octo issue list<cr>", desc = "List issues" },
          { "<leader>gic", "<cmd>Octo issue create<cr>", desc = "Create issue" },
          { "<leader>gie", "<cmd>Octo issue edit<cr>", desc = "Edit issue" },
          { "<leader>gix", "<cmd>Octo issue close<cr>", desc = "Close issue" },
          { "<leader>giu", "<cmd>Octo issue reopen<cr>", desc = "Reopen issue" },
          { "<leader>giv", "<cmd>Octo issue browser<cr>", desc = "Open issue in browser" },
          { "<leader>gis", "<cmd>Octo issue search<cr>", desc = "Search issues" },
          { "<leader>gia", "<cmd>Octo assignee add<cr>", desc = "Add assignee" },
          { "<leader>gir", "<cmd>Octo assignee remove<cr>", desc = "Remove assignee" },

          -- Review operations
          {
            "<leader>gr",
            group = "review",
            icon = { icon = " ", color = "purple" },
          },
          { "<leader>grs", "<cmd>Octo review start<cr>", desc = "Start review" },
          { "<leader>grc", "<cmd>Octo review commit<cr>", desc = "Comment review" },
          { "<leader>gra", "<cmd>Octo review approve<cr>", desc = "Approve review" },
          { "<leader>grr", "<cmd>Octo review changes<cr>", desc = "Request changes" },
          { "<leader>grb", "<cmd>Octo review submit<cr>", desc = "Submit review" },
          { "<leader>grd", "<cmd>Octo review discard<cr>", desc = "Discard review" },
          { "<leader>grf", "<cmd>Octo review resume<cr>", desc = "Resume review" },
          { "<leader>grt", "<cmd>Octo thread resolve<cr>", desc = "Resolve thread" },
          { "<leader>gru", "<cmd>Octo thread unresolve<cr>", desc = "Unresolve thread" },

          -- Repository operations
          {
            "<leader>go",
            group = "repo",
            icon = { icon = " ", color = "green" },
          },
          { "<leader>gov", "<cmd>Octo repo browser<cr>", desc = "Open repo in browser" },
          { "<leader>gol", "<cmd>Octo repo list<cr>", desc = "List repos" },
          { "<leader>gof", "<cmd>Octo repo fork<cr>", desc = "Fork repo" },
          { "<leader>gou", "<cmd>Octo repo url<cr>", desc = "Copy repo URL" },
          { "<leader>gor", "<cmd>Octo repo view<cr>", desc = "View repo info" },

          -- Gist operations
          {
            "<leader>gg",
            group = "gist",
            icon = { icon = " ", color = "yellow" },
          },
          { "<leader>ggl", "<cmd>Octo gist list<cr>", desc = "List gists" },
          { "<leader>ggc", "<cmd>Octo gist create<cr>", desc = "Create gist" },

          -- Git operations (LazyVim defaults + custom)
          { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
          { "<leader>gB", "<cmd>Gitsigns blame_line<cr>", desc = "Blame current line" },
          { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff this file" },
          { "<leader>gD", "<cmd>Gitsigns diffthis ~<cr>", desc = "Diff this file (staged)" },
          { "<leader>gh", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
          { "<leader>gH", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview hunk inline" },
          { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset buffer" },
          { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk" },
          { "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage buffer" },
          { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo stage hunk" },
          { "<leader>gU", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset hunk" },
          { "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle line blame" },
          { "<leader>gL", "<cmd>Gitsigns toggle_linehl<cr>", desc = "Toggle line highlight" },
          { "<leader>gw", "<cmd>Gitsigns toggle_word_diff<cr>", desc = "Toggle word diff" },
          { "<leader>gz", "<cmd>Gitsigns toggle_signs<cr>", desc = "Toggle git signs" },
        },
      },
    },
  },
}
