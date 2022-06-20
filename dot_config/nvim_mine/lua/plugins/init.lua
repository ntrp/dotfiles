-- local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
-- vim.api.nvim_create_autocmd(
--   "BufWritePost",
--   {
--     command = "source <afile> | PackerCompile",
--     group = packer_group,
--     pattern = "**/*.lua"
--   }
-- )

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

require("packer").startup({
  function(use)
    local useCustom = function(module_name)
      local module_loaded, module = pcall(require, module_name)
      if not module_loaded then
        print("Failed to load module [" .. module_name .. "]: " .. module)
        return
      end
      for _, plugin in ipairs(module or {}) do
        local _, error = pcall(use, plugin)
        if error then
          print("Failed to load plugin [" .. P(plugin) .. "]: \n" .. error)
        end
      end
    end
    -- Initialize basic plugins
    useCustom('plugins.bootstrap')
    -- Key visualizer
    useCustom('plugins.which-key')
    -- Load all plugins from this directory
    for _, plugin in ipairs(vim.fn.readdir(vim.fn.stdpath('config') .. '/lua/plugins/auto')) do
      if not plugin:match "\\.lua$" then
        useCustom("plugins.auto." .. plugin)
      end
    end
    require('utils').wkRegister({
      P = {
        name = 'Packer',
        s = { '<cmd>PackerSync<cr>', 'Sync' },
        S = { '<cmd>PackerStatus<cr>', 'Status' },
        c = { '<cmd>PackerCompile<cr>', 'Compile' }
      }
    })
  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
    profile = {
      enable = true,
      threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },
  },
})

if packer_bootstrap then
  require("packer").sync()
end
