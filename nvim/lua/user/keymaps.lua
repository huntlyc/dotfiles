vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>l', '<cmd>nohlsearch<CR>', {desc = "Stop highlighting search term"})
-- go to non-existant file
vim.keymap.set('', 'gf', '<cmd>edit <cfile><CR>', {desc = "Go to file (create if doesn't exist)"})

-- reselect visual selection after indent change
vim.keymap.set('v', '<', '<gv', {desc = "Unindent visual selection, keeping visual selection"})
vim.keymap.set('v', '>', '>gv', {desc = "Indent visual selection, keeping visual selection"})

vim.keymap.set('n', '<leader>gx', '<cmd>!xdg-open %<cr><cr>', {desc = "Open external"})
vim.keymap.set('n', '<leader>ve', '<cmd>e /home/huntly/.config/nvim/init.lua<CR>', {desc = "Edit conf"})
vim.keymap.set('n', '<leader>vk', '<cmd>e /home/huntly/.config/nvim/lua/user/keymap.lua<CR>', {desc = "Edit keymaps"})


-- vim quick wins
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', {desc = "Write"})
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', {desc = "Quit"})
vim.keymap.set('n', '<leader>c', '<cmd>clo<CR>', {desc = "Close buffer"})
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', {desc = "Next Buffer"})
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<CR>', {desc = "Prev buffer"})
vim.keymap.set('n', "<leader>y", "\"+y", {desc = "Copy to sys clipboard"})
vim.keymap.set('v', "<leader>y", "\"+y", {desc = "Copy to sys clipboard"})
vim.keymap.set('n', "<leader>Y", "\"+Y", {desc = "Copy to sys clipboard"})
vim.keymap.set('n', "Y", "yg$", {desc = "Yank rest of line from cursor"})
vim.keymap.set('n', "n", "nzzzv", {desc = "Go to next, middle of screen, visually select match"})
vim.keymap.set('n', "N", "Nzzzv", {desc = "Go to prev, middle of screen, visually select match"})
vim.keymap.set('n', "J", "mzJ`z", {desc = "Join line, leave cursor as-is"})
vim.keymap.set('n', "<C-d>", "<C-d>zz", {desc = "Go down, center screen"})
vim.keymap.set('n', "<C-u>", "<C-u>zz", {desc = "Go up, center screen"})

vim.keymap.set('v', "J", ":m '>+1<CR>gv=gv", {desc = "Move visually selected line down"})
vim.keymap.set('v', "K", ":m '<-2<CR>gv=gv", {desc = "Move visually selected line up"})

-- packer
vim.keymap.set('n', '<leader>ps', '<cmd>PackerSync<CR>', {desc = "Packer sync"})

-- vimtree
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', {desc = "Toggle NvimTree"})

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


-- harpoon keymaps
vim.keymap.set("n", "<leader>hw", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", {desc = "Show harpoon menu"})
-- harpoon add files
vim.keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", {desc = "Add current file to harpoon list"})
-- harpoon nav files
vim.keymap.set("n", "<leader>j", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", {desc = "Go to harpoon file 1"})
vim.keymap.set("n", "<leader>k", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", {desc = "Go to harpoon file 2"})
vim.keymap.set("n", "<leader>l", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", {desc = "Go to harpoon file 3"})
vim.keymap.set("n", "<leader>;", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", {desc = "Go to harpoon file 4"})




-- dap
vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", {desc = "Toggle breakpoint"})
vim.keymap.set("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition:'))<cr>", {desc = "Toggle conditional break"})
vim.keymap.set("n", "<leader>dlp", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point msg'))<cr>", {desc = "Log point messsage"})
vim.keymap.set("n", "<leader>dt", "<cmd>lua require'dap-go'.debug_test()<cr>", {desc = "DAP-Go debug test"})
vim.keymap.set("n", "dc", "<cmd>lua require'dap'.continue()<cr>", {desc = "DAP start/continue"})
vim.keymap.set("n", "<leader>dT", "<cmd>lua require'dap'.terminate()<cr>", {desc = "DAP start/continue"})
vim.keymap.set("n", "do", "<cmd>lua require'dap'.step_over()<cr>", {desc = "DAP step over"})
vim.keymap.set("n", "di", "<cmd>lua require'dap'.step_into()<cr>", {desc = "DAP step into"})


local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
