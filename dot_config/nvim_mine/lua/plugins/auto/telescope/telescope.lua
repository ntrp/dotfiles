return {
  -- https://github.com/nvim-telescope/telescope.nvim
  'nvim-telescope/telescope.nvim',
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    telescope.setup {
      defaults = {
        layout_strategy = 'flex',
        mappings = {
          n = {
            ["q"] = actions.close,
            ["<Esc>"] = actions.close,
            ["<C-n>"] = actions.move_selection_next,
            ["<C-p>"] = actions.move_selection_previous,
            ["<C-f>"] = actions.preview_scrolling_up,
            ["<C-b>"] = actions.preview_scrolling_down,
          },
          i = {
            ["<Esc>"] = actions.close,
            ["<C-u>"] = false, -- Clear the prompt
            ["<C-s>"] = actions.select_horizontal,
            ["<C-f>"] = actions.preview_scrolling_up,
            ["<C-b>"] = actions.preview_scrolling_down,
          }
        },
        file_ignore_patterns = {
          "node_modules",
        },
      },
      pickers = {
        lsp_code_actions = {
          theme = "cursor",
        },
      },
    }

    require('utils').wkRegister({
      ["<tab>"] = { "<cmd>Telescope buffers<cr>", "Open buffers" }, -- create a binding with label
      S = {
        name = "Settings",
        v = { "<cmd>Telescope vim_options<cr>", "VIM Options" },
        c = { "<cmd>Telescope colorscheme<cr>", "Color scheme" },
      },
      f = {
        name = "Find", -- optional group name
        f = { "<cmd>Telescope find_files<cr>", "Files" },
        h = { "<cmd>Telescope find_files hidden=true<cr>", "Hidden files" },
        w = { "<cmd>Telescope live_grep<cr>", "Text" },
        b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Text in buffer" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
        ['"'] = { "<cmd>Telescope registers<cr>", "Registers" },
        m = { "<cmd>Telescope marks<cr>", "Marks" },
        j = { "<cmd>Telescope jumplist<cr>", "Jump list" },
      },
      h = {
        name = "Help",
        h = { "<cmd>Telescope help_tags<cr>", "Help" },
        m = { "<cmd>Telescope man_pages<cr>", "Man pages" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        a = { "<cmd>Telescope autocommands<cr>", "Auto commands" },
        C = { "<cmd>Telescope command_history<cr>", "Command history" },
        s = { "<cmd>Telescope search_history<cr>", "Search history" },
        l = { "<cmd>Telescope highlights<cr>", "Inspect highlights" },
      }
    })
  end
}
