local install = require 'lspinstall'
local config = require 'lspconfig'
local jdtls = require 'jdtls'

install.setup()
local servers = install.installed_servers()
for _, server in pairs(servers) do
    config[server].setup {}
end

jdtls.start_or_attach { cmd = { 'java-lsp.sh' } }
