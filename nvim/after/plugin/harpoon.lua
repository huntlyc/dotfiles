-- harpoon keymaps
vim.keymap.set("n", "<leader>hw", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", {desc = "Show harpoon menu"})
vim.keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", {desc = "Add current file to harpoon list"})
-- harpoon nav files
vim.keymap.set("n", "<leader>j", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", {desc = "Go to harpoon file 1"})
vim.keymap.set("n", "<leader>k", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", {desc = "Go to harpoon file 2"})
vim.keymap.set("n", "<leader>l", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", {desc = "Go to harpoon file 3"})
vim.keymap.set("n", "<leader>;", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", {desc = "Go to harpoon file 4"})



