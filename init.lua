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

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    local manager = require 'neo-tree.sources.manager'
    local renderer = require 'neo-tree.ui.renderer'

    local state = manager.get_state 'filesystem'
    local window_exists = renderer.window_exists(state)
    if window_exists then
      vim.cmd 'Neotree close'
    end
  end,
})

-- NOTE: The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--
--  NOTE: Extra not so important keybinds
vim.keymap.set('n', '<S-Tab>', '<cmd>Neotree<CR>', { desc = 'Neotree' })
vim.keymap.set('n', '<leader><leader>s', '<cmd>so ~/.config/nvim/lua/soham/snippets.lua<CR>')
require 'soham.snippets'
