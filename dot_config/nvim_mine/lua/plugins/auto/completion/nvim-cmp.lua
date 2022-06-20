return {
  'hrsh7th/nvim-cmp',
  requires = {
    'nvim-lua/plenary.nvim',
  },
  event = "InsertEnter",
  config = function()
    local _, luasnip = pcall(require, "luasnip")
    local cmp = require("cmp")
    require('cmp-npm').setup({})

    local kind_icons = {
      -- Text = "",
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "",
      Interface = "ﰮ",
      Module = "",
      Property = "ﴯ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = "",
    }

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    cmp.setup {
      -- Don't preselect item
      preselect = cmp.PreselectMode.Item,
      -- mapping = cmp.mapping.preset.insert(mapping),
      mapping = {
        ['<C-j>'] = cmp.mapping.scroll_docs(-4),
        ['<C-k>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({
          behaviour = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
        ["<Esc>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.abort()
          end
          fallback()
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
      window = {
        documentation = {
          border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
          winhighlight = "FloatBorder:TelescopePromptBorder,CursorLine:TelescopeSelection,Search:None"
        },
        completion = {
          border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
          winhighlight = "FloatBorder:TelescopePromptBorder,CursorLine:TelescopeSelection,Search:None"
        }
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp', },
        { name = 'nvim_lua', },
        { name = "luasnip", },
        { name = 'nvim_lsp_signature_help', },
        { name = "path", },
        { name = "buffer", },
        { name = "orgmode" },
        { name = 'npm', keyword_length = 4 },
      }),
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      formatting = {
        format = function(entry, vim_item)
          -- Show kind icons
          vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
          -- Show source
          vim_item.menu = ({
            buffer = "[BUFFER]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[API]",
            path = "[PATH]",
            luasnip = "[SNIPPET]",
            -- dictionary = "[DICTIONARY]",
            nvim_lsp_document_symbol = "[SYMBOL]"
          })[entry.source.name]
          -- Custumize padding
          vim_item.abbr = ' ' .. vim_item.abbr
          return vim_item
        end
      },
      experimental = {
        native_menu = false,
        ghost_text = true,
      },
    }

    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' },
      }, {
        { name = "buffer", },
        { name = "path", },
      })
    })
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'nvim_lsp_document_symbol' }, -- trigger by "/@"
      }, {
        { name = 'buffer' }
      })
    })
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
    cmp.setup.filetype('fish', {
      sources = cmp.config.sources({
        { name = 'fish' },
      }, {
        { name = "buffer", },
        { name = "path", },
      })
    })
  end
}
