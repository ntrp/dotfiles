return {
  "nvim-neorg/neorg",
  after = {
    "nvim-treesitter"
  },
  config = function()
    require('neorg').setup {
      load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
          config = {
            workspaces = {
              default = "~/norg/private",
              work = "~/norg/work",
            }
          }
        },
        ["core.norg.journal"] = {
          config = {
          }
        },
        ["core.gtd.base"] = {
          config = {
            workspace = 'default'
          }
        },
        ["core.presenter"] = {
          config = {
            zen_mode = 'truezen'
          }
        },
        ["core.norg.concealer"] = {
          config = {
          }
        },
        ["core.export"] = {
          config = {
          }
        }
      }
    }

    require('utils').wkRegister({
      N = {
        name = "Neorg",
        a = { "<cmd>Neorg gdt views<CR>", "Agenda" },
        n = { "<cmd>Neorg gdt<Tab>3<CR>", "Capture" },
        j = {
          name = "Journal",
          n = { "<cmd>Neorg journal today<CR>", "Today" },
          y = { "<cmd>Neorg journal yesterday<CR>", "Yesterday" },
          t = { "<cmd>Neorg journal tomorrow<CR>", "Tomorrow" },
          c = { "<cmd>Neorg journal custom<CR>", "Custom" },
        },
        e = {
          name = "Edit",
          m = { "<cmd>Neorg inject-metadata<CR>", "Inject metadata" },
        }
      }
    })
  end,
}
