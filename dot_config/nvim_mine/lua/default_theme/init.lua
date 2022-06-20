vim.cmd "highlight clear"
if vim.fn.exists "syntax_on" then
  vim.cmd "syntax reset"
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "default_theme"

C = require "default_theme.colors"
local utils = require "default_theme.utils"

local highlights = {}

for _, module in ipairs { "base", "treesitter", "lsp" } do
  highlights = vim.tbl_deep_extend("force", highlights, require("default_theme." .. module))
end

for _, plugin in ipairs(vim.fn.readdir(vim.fn.stdpath('config') .. '/lua/default_theme/plugins')) do
  highlights = vim.tbl_deep_extend("force", highlights, require("default_theme.plugins." .. plugin:match("(.+)%..+")))
end

for group, spec in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, utils.parse_style(spec))
end
