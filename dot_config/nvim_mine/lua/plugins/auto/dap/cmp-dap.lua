return {
  -- https://github.com/rcarriga/cmp-dap
  'rcarriga/cmp-dap',
  config = function()
    local cmp = require 'cmp'
    local cmp_dap = require 'cmp_dap'
    cmp.setup.filetype("dap-repl", {
      enabled = function()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
            or cmp_dap.is_dap_buffer()
      end,
      sources = {
        {
          name = "dap",
        }
      }
    })
  end
}
