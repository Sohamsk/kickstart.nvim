require 'soham.basic'
require 'soham.config.lazy'

-- highlight on text yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- NOTE: The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--
--  NOTE: Extra not so important keybinds
vim.keymap.set('n', '<S-Tab>', '<cmd>Neotree<CR>')
vim.keymap.set('n', '<leader><leader>s', '<cmd>so ~/.config/nvim/lua/soham/snippets.lua<CR>')
require 'soham.snippets'
