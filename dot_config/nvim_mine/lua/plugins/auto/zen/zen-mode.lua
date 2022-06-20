return {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup {}

    require('utils').wkRegister({
      z = { "<cmd>ZenMode<cr>", "Zen mode" }
    })
  end
}
