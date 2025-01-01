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

-- Function to attach to autorun command to buffer
local attachAutorunToBuffer = function(bufn, pattern, command)
  vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('autorun', { clear = true }),
    pattern = pattern,
    callback = function()
      local function appendData(_, data)
        if data then
          vim.api.nvim_buf_set_lines(bufn, -1, -1, false, data)
        end
      end
      vim.api.nvim_buf_set_lines(bufn, 0, -1, false, { 'The output of main.go is:' })
      vim.fn.jobstart(command, {
        stdout_buffered = true,
        on_stdout = appendData,
        on_stderr = appendData,
      })
    end,
  })
end

-- Creater user command for attaching autorun to buffer
vim.api.nvim_create_user_command('Autorun', function()
  print 'AutoRun starts now...'
  vim.cmd.new { mods = { vertical = true } }
  local bufn = vim.api.nvim_get_current_buf()
  local pattern = vim.fn.input 'Pattern: '
  local command = vim.split(vim.fn.input 'Command: ', ' ')
  attachAutorunToBuffer(tonumber(bufn), pattern, command)
end, {})
