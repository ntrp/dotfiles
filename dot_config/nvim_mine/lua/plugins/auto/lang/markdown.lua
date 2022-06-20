-- https://github.com/frabjous/knap
return {
  'frabjous/knap',
  ft = {
    'markdown',
    'tex',
  },
  setup = function()
    local gknapsettings = {
      textopdf = "xelatex -interaction=batchmode -halt-on-error -synctex=1 %docroot%",
      delay = 500,
      mdtohtmlviewerlaunch = "qutebrowser %outputfile%",
      mdtohtmlviewerrefresh = "qutebrowser :reload",
      markdowntohtmlviewerlaunch = "qutebrowser %outputfile%",
      markdowntohtmlviewerrefresh = "qutebrowser :reload",
    }
    vim.g.knap_settings = gknapsettings
  end
}
