return {
  -- https://github.com/sudormrfbin/cheatsheet.nvim
  'sudormrfbin/cheatsheet.nvim',
  requires = {
    { 'nvim-telescope/telescope.nvim' },
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
  },
  config = function()
    require 'utils'.wkRegister {
      h = {
        c = { "<cmd>Cheatsheet<CR>", "Cheatsheet" }
      }
    }
  end
}
