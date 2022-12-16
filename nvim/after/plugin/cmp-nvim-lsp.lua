local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function(client, bufnr)
    -- LSP && Telescope mappings
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr,"n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>gg", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>gr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>gb", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>gtr", "<cmd>Telescope lsp_references<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>gl", "<cmd>Telescope diagnostics<cr>", opts)

    require "lsp_signature".on_attach(signature_setup, bufnr)  -- Note: add in lsp client on-attach

end



require'lspconfig'.rust_analyzer.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

require'lspconfig'.gopls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}
require'lspconfig'.golangci_lint_ls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

require'lspconfig'.tsserver.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

require'lspconfig'.cssls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require'lspconfig'.emmet_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less','php' },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
}


require'lspconfig'.intelephense.setup{

    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
        licenceKey = os.getenv('INTELEPHENSELICENCE'),
    },
    filetypes = { "php", "phtml" },
    settings = {
        intelephense = {
            maxMemory = 4096,
            stubs = {
                "bcmath",
                "bz2",
                "calendar",
                "Core",
                "curl",
                "date",
                "dba",
                "dom",
                "enchant",
                "fileinfo",
                "filter",
                "ftp",
                "gd",
                "gettext",
                "hash",
                "iconv",
                "imap",
                "intl",
                "json",
                "ldap",
                "libxml",
                "mbstring",
                "mcrypt",
                "mysql",
                "mysqli",
                "password",
                "pcntl",
                "pcre",
                "PDO",
                "pdo_mysql",
                "Phar",
                "readline",
                "recode",
                "Reflection",
                "regex",
                "session",
                "SimpleXML",
                "soap",
                "sockets",
                "sodium",
                "SPL",
                "standard",
                "superglobals",
                "sysvsem",
                "sysvshm",
                "tokenizer",
                "xml",
                "xdebug",
                "xmlreader",
                "xmlwriter",
                "yaml",
                "zip",
                "zlib",
                "wordpress",
                "woocommerce",
                "acf-pro",
                "wordpress-globals",
            },
            environment = {
              includePaths = {
                  '/Users/huntlycameron/.composer/vendor/php-stubs',
                  '/Users/huntlycameron/code/wordpress'
              }
            },
            files = {
                maxSize = 5000000;
            };
        }
    }
}
