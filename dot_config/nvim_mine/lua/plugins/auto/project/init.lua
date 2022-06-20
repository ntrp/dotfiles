return {
  { -- https://github.com/ahmedkhalf/project.nvim
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {}

      require('telescope').load_extension('projects')

      require('utils').wkRegister({
        f = {
          p = { "<cmd>Telescope projects<CR>", "Projects" }
        }
      })
    end
  }
}
