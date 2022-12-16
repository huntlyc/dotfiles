vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


vim.keymap.set('n', '<leader>l', '<cmd>nohlsearch<CR>', {desc = "Stop highlighting search term"})
vim.keymap.set('', 'gf', '<cmd>edit <cfile><CR>', {desc = "Go to file (create if doesn't exist)"})

vim.keymap.set('v', '<', '<gv', {desc = "Unindent visual selection, keeping visual selection"})
vim.keymap.set('v', '>', '>gv', {desc = "Indent visual selection, keeping visual selection"})

vim.keymap.set('n', '<leader>gx', '<cmd>!xdg-open %<cr><cr>', {desc = "Open external"})
vim.keymap.set('n', '<leader>ve', '<cmd>e ~/.config/nvim/init.lua<CR>', {desc = "Edit conf"})
vim.keymap.set('n', '<leader>vk', '<cmd>e ~/.config/nvim/lua/user/keymap.lua<CR>', {desc = "Edit keymaps"})
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

vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', {desc = "Next Buffer"})
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<CR>', {desc = "Prev Buffer"})




-- vimtree
vim.keymap.set('n', '<leader>e', '<cmd>Ex<CR>', {desc = "File Browser"})






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
