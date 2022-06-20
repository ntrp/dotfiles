return {
  'nvim-telescope/telescope-packer.nvim',
  config = function()
    require 'telescope'.load_extension 'packer'

    require('utils').wkRegister({
      h = {
        P = { "<cmd>Telescope packer<cr>", "Packer" },
      }
    })
  end
}
