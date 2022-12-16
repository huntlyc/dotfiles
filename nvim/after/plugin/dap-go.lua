require("dap-go").setup();
vim.keymap.set("n", "<leader>dt", "<cmd>lua require'dap-go'.debug_test()<cr>", {desc = "DAP-Go debug test"})
