local M = {}
local install = require 'lspinstall'
local config = require 'lspconfig'
local jdtls = require 'jdtls'
local util = require 'util'

install.setup()
local servers = install.installed_servers()
for _, server in pairs(servers) do
    config[server].setup {}
end

function M.setup_java()
    jdtls.start_or_attach { 
        cmd = { 'java-lsp.sh' },
        root_dir = jdtls.setup.find_root({ 'pom.xml' })
    }
end

util.create_augroup({
    { 'FileType', 'java', 'lua require("lsp").setup_java()' }
}, 'jdtls')

return M
