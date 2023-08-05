local ok, jdtls = pcall(require, 'jdtls')
if not ok then return end

-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/omargtdev/Code/java-world/' .. project_name
local jdtls_installation_path = "/home/omargtdev/.local/share/nvim/mason/packages/jdtls"

local config = {
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {

        '/usr/lib/jvm/java-17-openjdk-amd64/bin/java', -- or '/path/to/java17_or_newer/bin/java'
        -- depends on if `java` is in your $PATH env variable and if it points to the right version.

        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

        -- 💀
        '-jar', jdtls_installation_path .. '/plugins/org.eclipse.equinox.launcher_1.6.500.v20230622-2056.jar',

        -- 💀
        '-configuration', jdtls_installation_path .. '/config_linux',

        -- 💀
        '-data', workspace_dir
    },

    -- 💀
    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    root_dir = require('jdtls.setup').find_root({ 'pom.xml', '.git', 'mvnw', 'gradlew' }),

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
        java = {
        }
    },

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
        bundles = {}
    },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)

-- Key mappings
local map = vim.keymap.set
map('n', '<A-o>', function() jdtls.organize_imports() end)
map('n', 'crv', function() jdtls.extract_variable() end)
map('v', 'crv', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>")
map('n', 'crc', function() jdtls.extract_constant() end)
map('v', 'crc', "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>")
map('v', 'crm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>")
