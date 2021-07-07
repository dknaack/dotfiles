local install = require 'lspinstall'
local config = require 'lspconfig'

install.setup()
local servers = install.installed_servers()
for _, server in pairs(servers) do
    config[server].setup {}
end
