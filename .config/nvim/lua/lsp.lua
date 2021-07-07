local install = require 'lspinstall'
local config = require 'lspconfig'

install.setup()
local server = install.installed_servers()
for _, server in pairs(server) do
    --config[server].setup { cmd = "jdtls.sh" }
    config[server].setup {}
end
