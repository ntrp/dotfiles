local dap = require('dap')

dap.adapters.chrome = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/path/to/vscode-chrome-debug/out/src/chromeDebug.js" } -- TODO adjust
}

local js_conf = {
  type = "chrome",
  request = "attach",
  program = "${file}",
  cwd = vim.fn.getcwd(),
  sourceMaps = true,
  protocol = "inspector",
  port = 9222,
  webRoot = "${workspaceFolder}"
}

dap.configurations.javascriptreact = { -- change this to javascript if needed
  js_conf
}

dap.configurations.javascript = { -- change this to javascript if needed
  js_conf
}

local ts_conf = {
  type = "chrome",
  request = "attach",
  program = "${file}",
  cwd = vim.fn.getcwd(),
  sourceMaps = true,
  protocol = "inspector",
  port = 9222,
  webRoot = "${workspaceFolder}"
}

dap.configurations.typescriptreact = { -- change to typescript if needed
  ts_conf
}

dap.configurations.typescript = { -- change to typescript if needed
  ts_conf
}
