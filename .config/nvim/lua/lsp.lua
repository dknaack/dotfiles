local M = {}
local install = require 'lspinstall'
local config = require 'lspconfig'
local jdtls = require 'jdtls'
local util = require 'util'

-- change diagnostics signs
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

install.setup()
local servers = install.installed_servers()
for _, server in pairs(servers) do
    config[server].setup {}
end

function M.setup_java()
    jdtls.setup_dap()

    jdtls.start_or_attach {
        cmd = { 'java-lsp.sh' },
        root_dir = jdtls.setup.find_root({ 'pom.xml' })
    }
end

util.create_augroup({
    { 'FileType', 'java', 'lua require("lsp").setup_java()' },
    { 'BufWritePre', '*.java', 'lua require("jdtls").organize_imports()' },
}, 'jdtls')

return M
