require("mason").setup()
require("mason-lspconfig").setup()

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...



local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- language server parser
local installed_lsp = {"lua_ls", "clangd", "rust_analyzer", "pyright", "typos_lsp"}

for _, lsp in ipairs(installed_lsp) do
  require("lspconfig")[lsp].setup {
    capabilities = capabilities
  }
end

local function enable_lsp_diagnostics()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      -- you can configure the virtual_text and signs options here
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = true,
    }
  )
end

vim.api.nvim_create_autocmd("InsertEnter", {
  group = vim.api.nvim_create_augroup("LspDiags", { clear = true }),
  callback = enable_lsp_diagnostics,
})
