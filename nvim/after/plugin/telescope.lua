require('telescope').load_extension('fzf')

-- Telescope FTFW
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope git_files<cr>", {desc = "Find files (Git Tracked)"}) -- respects .gitignore
vim.keymap.set("n", "<leader>fF", "<cmd>Telescope find_files<cr>", {desc = "Find files (Project Wide)"})
vim.keymap.set("n", "<leader>f*", "<cmd>Telescope grep_string<cr>", {desc = "Find all occurrences of current word"})
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", {desc = "Find a string "})
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {desc = "Search buffers"})
vim.keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>", {desc = "Search marks"})
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope registers<cr>", {desc = "Search Registers"})
vim.keymap.set("n", "<leader>f.", "<cmd>Telescope current_buffer_fuzzy_find<cr>", {desc = "Find in current file"})

-- LSP && Telescope
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {buffer = 0, desc ="Go to definition"})
vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, {buffer = 0, desc ="Go to type definition"})
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {buffer = 0, desc ="Go to Implementation"})

vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, {buffer = 0, desc = "Rename"})

vim.keymap.set("n", "<leader>gb", vim.diagnostic.goto_next, {desc = "Goto next diagnostic"})
vim.keymap.set("n", "<leader>gp", vim.diagnostic.goto_prev, {desc = "Goto prev diagnostic"})
vim.keymap.set("n", "<leader>gtr", "<cmd>Telescope lsp_references<cr>", {desc = "Find all refreces"})
vim.keymap.set("n", "<leader>gl", "<cmd>Telescope diagnostics<cr>", {desc = "Show all diagnostic messages"})

