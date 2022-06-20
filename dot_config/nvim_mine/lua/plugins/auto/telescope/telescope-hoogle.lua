return {
  -- https://github.com/luc-tielen/telescope_hoogle
  'luc-tielen/telescope_hoogle',
  ft = { 'haskell' },
  config = function()
    require('telescope').load_extension('hoogle')

    require('utils').wkRegister({
      h = {
        H = { "<cmd>Telescope hoogle<cr>", "Hoogle" },
      }
    })
  end
}
