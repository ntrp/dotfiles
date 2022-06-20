return {
  { -- https://github.com/mfussenegger/nvim-dap
    "mfussenegger/nvim-dap",
    config = function()
      for _, adapter in ipairs(vim.fn.readdir(vim.fn.stdpath('config') .. '/lua/plugins/auto/dap/adapters')) do
        local adapter_name = adapter:match("(.+)%..+")
        require("plugins.auto.dap.adapters." .. adapter_name)
      end

      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })
      vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = '', linehl = '', numhl = '' })
      vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = '', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '', texthl = '', linehl = '', numhl = '' })
      vim.fn.sign_define('DapLogPoint', { text = '', texthl = '', linehl = '', numhl = '' })

      require('utils').wkRegister({
        d = {
          name = 'DAP',
          a = { function() require 'dap'.run_last() end, "Run last" },
          b = { function() require 'dap'.toggle_breakpoint() end, "Toggle breakpoint" },
          B = {
            ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
            "Toggle conditional breakpoint"
          },
          l = { ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", "Log point" },
          r = { ":lua require'dap'.repl.toggle({}, 'vsplit')<CR><C-w>l", "REPL" },
          t = { function() require 'dap'.terminate() end, "Terminate" },
          c = { function() require 'dap'.run_to_cursor() end, "Run to cursor" },
          ["<F9>"] = { function() require 'dap'.continue() end, "Continue" },
          ["<F8>"] = { function() require 'dap'.step_over() end, "Step over" },
          ["<F7>"] = { function() require 'dap'.step_into() end, "Step into" },
          ["<S-F7>"] = { function() require 'dap'.step_out() end, "Step out" },
        }
      })
    end
  }
}
