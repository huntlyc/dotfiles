vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.signcolumn = 'yes:2'
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.listchars = 'tab:▸ ,trail:·'
vim.opt.mouse = 'a'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 3
vim.opt.confirm = true


-- death to trailing whitespace...
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

--vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--  pattern = { "*.css,*.scss,*.js" },
--  command = [[Neoformat]],
--})

require('telescope').load_extension('fzf')



-- lsp config
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

vim.opt.completeopt={"menu","menuone","noselect"}
  -- Setup nvim-cmp.
  local cmp = require'cmp'
  local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-Y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    sources = cmp.config.sources({
      { name = 'cmp_tabnine' },
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'cmp_tabnine' },
    }, {
      { name = 'buffer' },
    })
  })



local tabnine = require('cmp_tabnine.config')
tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = '..',
	ignored_file_types = {
		-- default is not to ignore
		-- uncomment to ignore in lua:
		-- lua = true
	},
	show_prediction_strength = false

})

--[[-- php file autocmd
local php_cmds = vim.api.nvim_create_augroup("PHPFixes", {clear = false});
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.php",
    command = "set filetype=html" ,
    group = php_cmds
});
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.php",
    command = "set syntax=php" ,
    group = php_cmds
});
]]--


require("nvim-dap-virtual-text").setup();
require("dap-go").setup();
require("dapui").setup();

local wk = require'which-key'
wk.setup()

wk.register({
  ["<leader>b"] = { name = "+buffers" },
  ["<leader>d"] = { name = "+debug" },
  ["<leader>f"] = { name = "+file" },
  ["<leader>g"] = { name = "+goto" },
  ["<leader>h"] = { name = "+harpoon" },
  ["<leader>p"] = { name = "+packer" },
  ["<leader>v"] = { name = "+nvimconf" },
})

require('Comment').setup()
