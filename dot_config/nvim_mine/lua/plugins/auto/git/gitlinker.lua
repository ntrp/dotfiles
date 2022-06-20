return {
  'ruifm/gitlinker.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require "gitlinker".setup {}

    require('utils').wkRegister({
      g = {
        y = {
          "<cmd>lua require'gitlinker'.get_buf_range_url()<cr>",
          "Yank Line",
        },
        b = {
          "<cmd>lua require'gitlinker'.get_buf_range_url('n', {action_callback = require'gitlinker.actions'.open_in_browser})<cr>",
          "Open Line",
        },
        Y = {"<cmd>lua require'gitlinker'.get_repo_url()<cr>", "Copy repo homepage"},
        B = {"<cmd>lua require'gitlinker'.get_repo_url({action_callback = require'gitlinker.actions'.open_in_browser})<cr>", "Open repo homepage"}
      }
    })
  end
}
