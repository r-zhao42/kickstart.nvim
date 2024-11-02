local augroup = vim.api.nvim_create_augroup
local ryanGroup = augroup('Ryan', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', { clear = true })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Start in insert mode when opening terminal
vim.api.nvim_create_autocmd('TermOpen', {
  group = ryanGroup,
  desc = 'Start insert mode when opening terminal',
  command = 'startinsert',
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = yank_group,
  callback = function()
    vim.highlight.on_yank()
  end,
})
