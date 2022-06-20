return {
  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  'nvim-treesitter/nvim-treesitter-textobjects',
  config = function()
    require 'nvim-treesitter.configs'.setup {
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        swap = {
          enable = true,
        },
        lsp_interop = {
          enable = true,
          border = 'none',
        },
      },
    }

    require('utils').wkRegister({
      l = {
        name = "LSP",
        p = {
          function() require 'nvim-treesitter.textobjects.lsp_interop'.peek_definition_code('@function.outer') end,
          "peek"
        },
        S = {
          function() require 'nvim-treesitter.textobjects.swap'.swap_previous('@parameter.inner') end,
          "swap with prev"
        },
        s = {
          function() require 'nvim-treesitter.textobjects.swap'.swap_next('@parameter.inner') end,
          "swap with next"
        }
      }
    })
  end
}
