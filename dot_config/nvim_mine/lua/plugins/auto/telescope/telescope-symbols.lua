return {
  -- https://github.com/nvim-telescope/telescope-symbols.nvim
  'nvim-telescope/telescope-symbols.nvim',
  config = function()
    require 'utils'.wkRegister {
      f = {
          s = { "<cmd>Telescope symbols<CR>", "Symbols" },
      }
    }
  end
}
