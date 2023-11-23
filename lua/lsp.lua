require("mason").setup()
require("mason-lspconfig").setup()

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...

-- installed_lsp = {"lua_ls", "clangd"}
  
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
	capabilities = capabilities
}
require("lspconfig").clangd.setup {
	capabilities = capabilities
}

