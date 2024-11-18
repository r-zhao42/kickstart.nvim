-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- Open diagnostics for under the current cursor
vim.keymap.set('n', '<leader>es', vim.diagnostic.open_float, { desc = '[S]how current diagnostics' })

vim.keymap.set('n', '<leader>en', function()
  vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
end, { desc = 'Go to [N]ext diagnostics' })

vim.keymap.set('n', '<leader>ep', function()
  vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }
end, { desc = 'Go to [P]revious diagnostics' })
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Keymap to paste from yank rather than last register
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"0p', { desc = 'Paste from the register 0 (yank register)' })
-- Keymap to delete and put into yank register rather than last register
-- vim.keymap.set({ 'n', 'v' }, '<leader>d', '"0d', { desc = 'delete and put into register 0 (yank register)' })

-- Keymaps for going into netrw
vim.keymap.set('n', '<leader>ex', '<cmd>Ex<CR>', { desc = 'Open File Explorer' })
vim.keymap.set('n', '<leader>ev', '<cmd>Vex<CR>', { desc = 'Open File Explorer' })
