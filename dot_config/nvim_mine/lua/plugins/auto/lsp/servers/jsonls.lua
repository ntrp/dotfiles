return {
  on_attach = require("plugins.auto.lsp.handlers").disable_formatting,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
    },
  },
}
