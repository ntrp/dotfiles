return {
  {
    'echasnovski/mini.nvim',
    config = function()
      -- https://github.com/echasnovski/mini.nvim#minisurround
      require('mini.surround').setup({
        custom_surroundings = nil,
        highlight_duration = 500,
        mappings = {
          add = 'gsa', -- Add surrounding in Normal and Visual modes
          delete = 'gsd', -- Delete surrounding
          find = 'gsf', -- Find surrounding (to the right)
          find_left = 'gsF', -- Find surrounding (to the left)
          highlight = 'gsh', -- Highlight surrounding
          replace = 'gsr', -- Replace surrounding
          update_n_lines = 'gsn', -- Update `n_lines`
        },
        n_lines = 20,
        search_method = 'cover',
      })
      require('mini.bufremove').setup({
        set_vim_settings = true,
      })

      require('utils').wkRegister({
        q = { "<cmd>bdelete<cr>", "Close Buffer" }
      })
    end
  },
  -- { broken with floats
  --   '~/_pws/Shade.nvim',
  --   config = function()
  --     require 'shade'.setup({
  --       overlay_opacity = 60,
  --       opacity_step = 10,
  --       debug = true
  --     })
  --
  --     require('utils').wkRegister({
  --       S = {
  --         s = {
  --           name = "Shade",
  --           t = { function() require('shade').toggle() end, "Toggle" },
  --           ["+"] = { function() require('shade').toggle() end, "Increase brightness" },
  --           ["-"] = { function() require('shade').toggle() end, "Decrease brightness" }
  --         }
  --       }
  --     })
  --   end
  -- },
  { -- https://github.com/numToStr/Comment.nvim
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  { -- https://github.com/AckslD/nvim-trevJ.lua
    'AckslD/nvim-trevJ.lua',
    config = function()
      require("trevj").setup()

      require('utils').wkRegister({
        j = { function() require('trevj').format_at_cursor() end, "Unsplit" }
      })
    end
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup()
    end
  }
}
