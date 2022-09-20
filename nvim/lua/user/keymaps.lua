vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>l', '<cmd>nohlsearch<CR>')
-- go to non-existant file
vim.keymap.set('', 'gf', '<cmd>edit <cfile><CR>')

-- reselect visual selection after indent change
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.keymap.set('n', '<leader>x', '<cmd>!xdg-open %<cr><cr>')
vim.keymap.set('n', '<leader>ve', '<cmd>e /home/huntly/.config/nvim/init.lua<CR>')


-- vim quick wins
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>')
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>')
vim.keymap.set('n', '<leader>c', '<cmd>clo<CR>')
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>')
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<CR>')

-- packer
vim.keymap.set('n', '<leader>ps', '<cmd>PackerSync<CR>')

-- vimtree
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')

-- Telescope FTFW
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope git_files<cr>") -- respects .gitignore
vim.keymap.set("n", "<leader>fF", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>f*", "<cmd>Telescope grep_string<cr>")
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>")
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope registers<cr>")
vim.keymap.set("n", "<leader>f.", "<cmd>Telescope current_buffer_fuzzy_find<cr>")

-- LSP && Telescope
local opts = { buffer = 0 }
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opts)
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)

vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, opts)

vim.keymap.set("n", "<leader>gb", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>gp", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>gtr", "<cmd>Telescope lsp_references<cr>")
vim.keymap.set("n", "<leader>gl", "<cmd>Telescope diagnostics<cr>")


-- harpoon keymaps
vim.keymap.set("n", "<leader>hw", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>")
-- harpoon add files
vim.keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>")
vim.keymap.set("n", "<leader>h1", "<cmd>lua require('harpoon.mark').add_file(1)<cr>")
vim.keymap.set("n", "<leader>h2", "<cmd>lua require('harpoon.mark').add_file(2)<cr>")
vim.keymap.set("n", "<leader>h3", "<cmd>lua require('harpoon.mark').add_file(3)<cr>")
vim.keymap.set("n", "<leader>h4", "<cmd>lua require('harpoon.mark').add_file(4)<cr>")
-- harpoon nav files
vim.keymap.set("n", "<leader>j", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>")
vim.keymap.set("n", "<leader>k", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>")
vim.keymap.set("n", "<leader>l", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>")
vim.keymap.set("n", "<leader>;", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>")
vim.keymap.set("n", "<leader>,", "<cmd>lua require('harpoon.ui').nav_next()<cr>")
vim.keymap.set("n", "<leader>.", "<cmd>lua require('harpoon.ui').nav_prev()<cr>")
-- harpoon goto tmux windows
vim.keymap.set("n", "<leader>hb", "<cmd>lua require('harpoon.tmux').gotoTerminal(2)<cr>")
vim.keymap.set("n", "<leader>hg", "<cmd>lua require('harpoon.tmux').gotoTerminal(3)<cr>")
