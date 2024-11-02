-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Start in insert mode when opening terminal
vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Start insert mode when opening terminal',
  command = 'startinsert',
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
