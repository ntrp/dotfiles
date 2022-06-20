return {
  "ANGkeith/telescope-terraform-doc.nvim",
  requires = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
  },
  config = function()
    require 'telescope'.load_extension 'terraform_doc'
    require 'utils'.wkRegister {
      h = {
        T = {
          name = "Terraform",
          p = { "<cmd>Telescope terraform_doc<CR>", "Providers" },
          m = { "<cmd>Telescope terraform_doc modules<CR>", "Modules" }
        }
      }
    }
  end
}
