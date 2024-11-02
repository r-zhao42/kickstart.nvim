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

-- NOTE:
-- Small test to see if I can write something like autopairs with autocommands.
-- Its much more complicated than i thought and this code doesn't work but want
-- to keep it here for posterity for a while
-- 1. use InsertCharPre command to check if the character is closing bracket
-- 2. use getcurpos() to get the position of cursor,
-- 3. then screenchar({row}, {col}) to get character in col after it
-- 4. If it is closing bracket, move cursor with setpos({expr}, {list})
--
--
-- Inserting a closing bracket when the next character is a closing bracket
-- puts the cursor after the bracket instead of inserting a character
-- vim.api.nvim_create_autocmd('InsertCharPre', {
--   desc = 'Exit bracket when typing closing bracket before closing bracket',
--    callback = function()
--  if vim.v.char == '}' then
--      local cursorPos = vim.fn.getpos '.'
--      local nextChar = vim.fn.screenchar(cursorPos[2], cursorPos[3] + 1)
--      print(table.concat(cursorPos, ', '))
--      if string.char(nextChar) == '}' then
--        vim.fn.setpos('.', { cursorPos[1], cursorPos[2], cursorPos[3] + 2, cursorPos[4] })
--        vim.v.char = ''
--      end
--    end
--  end,
--})
