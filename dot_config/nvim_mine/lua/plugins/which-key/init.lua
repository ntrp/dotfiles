return {
  { -- https://github.com/folke/which-key.nvim
    'folke/which-key.nvim',
    config = function()
      local which_key = require('which-key')
      which_key.setup({
        plugins = {
          spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
          },
        }
      })

      require('utils').wkRegister({
        w = { "<cmd>w<cr>", "Save" },
        W = { "<cmd>wa<cr>", "Save all" },
      })
    end
  }
}
