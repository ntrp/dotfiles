M = {}

M.wkRegister = function(conf, extra)
  extra = extra or {}
  local opts = { prefix = '<leader>', silent = true }
  for k, v in pairs(extra) do opts[k] = v end
  local has_wk, wk = pcall(require, "which-key")
  if not has_wk then return end
  wk.register(conf, opts)
end

return M
