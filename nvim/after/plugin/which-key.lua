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

