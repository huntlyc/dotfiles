require 'user.options'
require 'user.keymaps'
require 'user.plugins'

cfg = {…}  -- add you config here
require "lsp_signature".setup(cfg)
