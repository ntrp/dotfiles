return {
  -- https://github.com/nvim-treesitter/nvim-treesitter
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = function()
    require 'nvim-treesitter.configs'.setup {
      -- One of "all" or a list of languages
      -- Automatically install and upate treesitter
      ensure_installed = {
        "bash",
        "c",
        "comment", -- Comment tags like TODO, FIXME, NOTE:  ...
        "cpp",
        "css",
        "help", -- vimdoc
        "html",
        "http",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "latex",
        "lua",
        "markdown",
        "python",
        "regex",
        "typescript",
        "vim",
        "norg",
        "org"
      },
      -- Install languages synchronously (only applied to `ensure_installed`)
      sync_install = false,
      -- List of parsers to ignore installing
      -- ignore_install = { "javascript" },
      highlight = {
        enable = true,
        disable = { "html" },
        additional_vim_regex_highlighting = { "org" }
      },
      indent = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      autopairs = {
        enable = true
      },
      autotag = {
        enable = true,
      },
    }
    -- MARK: Setup folding
    vim.cmd "set foldmethod=expr"
    vim.cmd "set foldexpr=nvim_treesitter#foldexpr()"

    require('utils').wkRegister({
      T = {
        name = "Treesitter", -- optional group name
        s = { "<cmd>Telescope treesitter<cr>", "Show symbols" }, -- create a binding with label
      }
    })
  end
}
