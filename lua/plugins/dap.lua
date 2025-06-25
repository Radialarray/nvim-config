return {
  "mfussenegger/nvim-dap",
  optional = true,
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        vim.list_extend(opts.ensure_installed, {
          "js-debug-adapter",
          "chrome-debug-adapter",
          "firefox-debug-adapter",
        })
      end,
    },
  },
  opts = function()
    local dap = require("dap")
    if not dap.adapters.edge then
      dap.adapters.edge = {
        type = "executable",
        command = "node",
        args = {
          require("lazyvim.util").get_pkg_path("chrome-debug-adapter", "/out/src/chromeDebug.js"),
        },
      }
    end
    local vscode = require("dap.ext.vscode")

    -- Extend filetypes for browser debuggers
    local web_filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "svelte" }
    local angular_filetypes = { "typescript", "typescriptreact" }

    vscode.type_to_filetypes["chrome"] = angular_filetypes
    vscode.type_to_filetypes["firefox"] = angular_filetypes
    vscode.type_to_filetypes["edge"] = angular_filetypes

    -- Helper to avoid duplicate configs
    local function has_config(configs, name)
      for _, c in ipairs(configs) do
        if c.name == name then
          return true
        end
      end
      return false
    end

    -- Browser debug configurations
    local browser_configs = {
      {
        type = "chrome",
        request = "launch",
        name = "Launch Chrome against localhost",
        url = "http://localhost:4201",
        webRoot = "${workspaceFolder}",
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        runtimeExecutable = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome",
        runtimeArgs = { "--remote-debugging-port=9222" },
      },
      {
        type = "chrome",
        request = "attach",
        name = "Attach to Chrome",
        port = 9222,
        webRoot = "${workspaceFolder}",
      },
      {
        type = "firefox",
        request = "launch",
        name = "Launch Firefox against localhost",
        url = "http://localhost:4201",
        webRoot = "${workspaceFolder}",
        reAttach = true,
        port = 6000,
      },
      {
        type = "firefox",
        request = "attach",
        name = "Attach to Firefox",
        port = 6000,
        webRoot = "${workspaceFolder}",
      },
      {
        type = "edge",
        request = "launch",
        name = "Launch Edge against localhost",
        url = "http://localhost:4201",
        webRoot = "${workspaceFolder}",
        sourceMaps = true,
        protocol = "inspector",
        port = 9223,
        runtimeExecutable = "/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge",
        runtimeArgs = { "--remote-debugging-port=9223" },
      },
      {
        type = "edge",
        request = "attach",
        name = "Attach to Edge",
        port = 9223,
        webRoot = "${workspaceFolder}",
      },
    }

    for _, language in ipairs(web_filetypes) do
      dap.configurations[language] = dap.configurations[language] or {}
      local configs = dap.configurations[language]
      for _, browser_config in ipairs(browser_configs) do
        if not has_config(configs, browser_config.name) then
          table.insert(configs, browser_config)
        end
      end
    end
  end,
}
