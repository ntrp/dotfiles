return {
  { -- https://github.com/goolord/alpha-nvim
    'goolord/alpha-nvim',
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  }
}
