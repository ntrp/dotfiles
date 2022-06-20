local handlers = {}
local map = vim.keymap.set

local function lsp_highlight_document(client)
  if client.server_capabilities.document_highlight then
    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
      group = "lsp_document_highlight",
      pattern = "<buffer>",
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = "lsp_document_highlight",
      pattern = "<buffer>",
      callback = vim.lsp.buf.clear_references,
    })
  end
end

handlers.on_attach = function(client, bufnr)
  map("n", "K", function()
    vim.lsp.buf.hover()
  end, { desc = "Hover symbol details", buffer = bufnr })
  map("n", "<leader>la", function()
    vim.lsp.buf.code_action()
  end, { desc = "LSP code action", buffer = bufnr })
  map("n", "<leader>lf", function()
    vim.lsp.buf.format { async = true }
  end, { desc = "Format code", buffer = bufnr })
  map("n", "<leader>lh", function()
    vim.lsp.buf.signature_help()
  end, { desc = "Signature help", buffer = bufnr })
  map("n", "<leader>lr", function()
    vim.lsp.buf.rename()
  end, { desc = "Rename current symbol", buffer = bufnr })
  map("n", "gD", function()
    vim.lsp.buf.declaration()
  end, { desc = "Declaration of current symbol", buffer = bufnr })
  map("n", "gI", function()
    vim.lsp.buf.implementation()
  end, { desc = "Implementation of current symbol", buffer = bufnr })
  map("n", "gd", function()
    vim.lsp.buf.definition()
  end, { desc = "Show the definition of current symbol", buffer = bufnr })
  --map("n", "gr", function()
  --  vim.lsp.buf.references
  --end, { desc = "References of current symbol", buffer = bufnr })
  map("n", "<leader>ld", function()
    vim.diagnostic.open_float()
  end, { desc = "Hover diagnostics", buffer = bufnr })
  map("n", "[d", function()
    vim.diagnostic.goto_prev()
  end, { desc = "Previous diagnostic", buffer = bufnr })
  map("n", "]d", function()
    vim.diagnostic.goto_next()
  end, { desc = "Next diagnostic", buffer = bufnr })
  map("n", "gl", function()
    vim.diagnostic.open_float()
  end, { desc = "Hover diagnostics", buffer = bufnr })
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
    vim.lsp.buf.formatting()
  end, { desc = "Format file with LSP" })

  lsp_highlight_document(client)
end

handlers.knap_on_attach = function(_, bufnr)
  -- F5 processes the document once, and refreshes the view
  map('i', '<F5>', function() require("knap").process_once() end, { desc = "Refresh view", buffer = bufnr })
  map('v', '<F5>', function() require("knap").process_once() end, { desc = "Refresh view", buffer = bufnr })
  map('n', '<F5>', function() require("knap").process_once() end, { desc = "Refresh view", buffer = bufnr })
  -- F6 closes the viewer application, and allows settings to be reset
  map('i', '<F6>', function() require("knap").close_viewer() end, { desc = "Close view", buffer = bufnr })
  map('v', '<F6>', function() require("knap").close_viewer() end, { desc = "Close view", buffer = bufnr })
  map('n', '<F6>', function() require("knap").close_viewer() end, { desc = "Close view", buffer = bufnr })
  -- F7 toggles the auto-processing on and off
  map('i', '<F7>', function() require("knap").toggle_autopreviewing() end,
    { desc = "Toggle auto preview", buffer = bufnr })
  map('v', '<F7>', function() require("knap").toggle_autopreviewing() end,
    { desc = "Toggle auto preview", buffer = bufnr })
  map('n', '<F7>', function() require("knap").toggle_autopreviewing() end,
    { desc = "Toggle auto preview", buffer = bufnr })
  -- F8 invokes a SyncTeX forward search, or similar, where appropriate
  map('i', '<F8>', function() require("knap").forward_jump() end, { desc = "Forward Search", buffer = bufnr })
  map('v', '<F8>', function() require("knap").forward_jump() end, { desc = "Forward Search", buffer = bufnr })
  map('n', '<F8>', function() require("knap").forward_jump() end, { desc = "Forward Search", buffer = bufnr })
end

handlers.disable_formatting = function(client)
  client.server_capabilities.document_formatting = false
end

handlers.compute_opts = function(opts)
  local old_on_attach = opts.on_attach
  opts.on_attach = function(client, bufnr)
    if old_on_attach then
      old_on_attach(client, bufnr)
    end
    handlers.on_attach(client, bufnr)
  end
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local has_nvim_cmp, nvim_cmp = pcall(require, 'cmp_nvim_lsp')
  if has_nvim_cmp then
    capabilities = nvim_cmp.update_capabilities(capabilities)
  end
  opts.capabilities = capabilities
  return opts
end

return handlers
