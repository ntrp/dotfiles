return {
  require("plugins.auto.completion.nvim-cmp"),
  { 'saadparwaiz1/cmp_luasnip' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-nvim-lsp-signature-help' },
  { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'David-Kunz/cmp-npm' },
  { "mtoohey31/cmp-fish", ft = "fish" },
  require("plugins.auto.completion.nvim-autopairs"),
  require("plugins.auto.completion.nvim-ts-autotag"),
}
