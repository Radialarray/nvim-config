-- Enhanced autocompletion configuration for LazyVim
return {
  -- Blink completion engine with optimized tab behavior
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap = {
        preset = "super-tab",
        ["<Tab>"] = { "select_and_accept" },
        ["<S-Tab>"] = { "select_prev" },
      }
      return opts
    end,
  },
}
