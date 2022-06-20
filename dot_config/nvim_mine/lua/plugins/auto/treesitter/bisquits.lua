return {
  -- https://github.com/code-biscuits/nvim-biscuits
  'code-biscuits/nvim-biscuits',
  config = function()
    require('nvim-biscuits').setup({
      on_events = { 'InsertLeave', 'CursorHold' },
      cursor_line_only = true,
      show_on_start = false,
    })

    require('utils').wkRegister({
      S = {
        b = { function() require('nvim-biscuits').toggle_biscuits() end, "Toggle bisquits" },
      }
    })
  end
}
