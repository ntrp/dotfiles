return {
  "neovim/nvim-lspconfig",
  requires = {
    'b0o/schemastore.nvim'
  },
  config = function()
    local handlers = require("plugins.auto.lsp.handlers")
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    -- Change diagnostic symbol in signl column
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.diagnostic.config({
      virtual_text = true,
      signs = { active = signs },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
    -- Add border to floats
    local border = {
      { "╭", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╮", "FloatBorder" },
      { "│", "FloatBorder" },
      { "╯", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╰", "FloatBorder" },
      { "│", "FloatBorder" },
    }
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or border
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    -- Setup Servers
    local lspconfig = require("lspconfig")
    -- initialize servers
    for _, server in ipairs(vim.fn.readdir(vim.fn.stdpath('config') .. '/lua/plugins/auto/lsp/servers')) do
      local server_name = server:match("(.+)%..+")
      local server_config = require('plugins.auto.lsp.servers.' .. server_name)
      local opts = handlers.compute_opts(server_config)
      lspconfig[server_name].setup(opts)
    end
  end
}
