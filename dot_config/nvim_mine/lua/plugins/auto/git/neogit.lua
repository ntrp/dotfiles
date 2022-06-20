return {
  'TimUntersberger/neogit',
  requires = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('neogit').setup {}

    require('utils').wkRegister({
      g = {
        n = { "<cmd>Neogit<cr>", "Neogit" },
      }
    })
  end
}
