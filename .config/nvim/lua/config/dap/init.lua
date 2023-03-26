local status_ok, dap = pcall(require, "dap")
if not status_ok then
  vim.notify("dap not found!!")
  return
end

dap.adapters = {
  python = {
    type = "executable",
    command = "python",
    args = { "-m", "debugpy.adapter" },
  },
  haskell = {
    type = 'executable';
    command = 'haskell-debug-adapter';
    args = { '--hackage-version=0.0.33.0' };
  },
  lldb = {
    type = 'executable',
    command = '/etc/profiles/per-user/xander/bin/lldb-vscode', -- adjust as needed, must be absolute path
    name = 'lldb'
  },
}

dap.defaults.fallback.external_terminal = {
  command = "/usr/bin/alacritty",
  args = { "-e" },
}

local icons = require "config.icons"
vim.fn.sign_define("DapBreakpoint", {
  text = "Br",
  texthl = "DiagnosticHint",
  linehl = "",
  numhl = "",
})


require("config.dap.configurations")

-- DAPUI CONFIGURATION

local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
  vim.notify("dapui not found!!")
  return
end

require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>", "l" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  layouts = {
    {
      elements = {
        "scopes",
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 10,
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "rounded", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
