return {
  'L3MON4D3/LuaSnip',
  build = (function()
    -- Build Step is needed for regex support in snippets.
    -- This step is not supported in many windows environments.
    -- Remove the below condition to re-enable on windows.
    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
      return
    end
    return 'make install_jsregexp'
  end)(),
  dependencies = {
    -- `friendly-snippets` contains a variety of premade snippets.
    --    See the README about individual language/framework/plugin snippets:
    --    https://github.com/rafamadriz/friendly-snippets
    {
      'rafamadriz/friendly-snippets',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
  },
  config = function()
    local ls = require 'luasnip'

    ls.config.set_config {
      -- remeber last snipper
      history = true,

      -- Dynamic snippets that update as you type
      updateevents = 'TextChanged,TextChangedI',
    }

    -- Expand current item or jump to the next item within the snippet
    vim.keymap.set({ 'i', 's' }, '<c-k>', function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })

    -- Move to the previous item within the snippet
    vim.keymap.set({ 'i', 's' }, '<c-j>', function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true })

    -- Selecting within a list of option, useful for choice nodes
    vim.keymap.set('i', '<c-l>', function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end)

    -- shortcut to source luasnipt file
    vim.keymap.set('n', '<leader><leader>s', '<cmd>source ~/.config/nvim/lua/ryan/plugins/luasnips.lua<CR>')
  end,
}
