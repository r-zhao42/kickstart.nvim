local leet_arg = 'leetcode.nvim'

return {
  'kawre/leetcode.nvim',
  build = ':TSUpdate html', -- if you have `nvim-treesitter` installed
  dependencies = {
    'nvim-telescope/telescope.nvim',
    -- "ibhagwan/fzf-lua",
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  lazy = leet_arg ~= vim.fn.argv(0, -1),
  opts = {
    arg = leet_arg,
    ---@type lc.lang
    lang = 'python3', -- configuration goes here
    ---@type boolean
    image_support = true,
    keys = {
      toggle = { 'q' }, ---@type string|string[]
      confirm = { '<CR>' }, ---@type string|string[]

      reset_testcases = 'r', ---@type string
      use_testcase = 'U', ---@type string
      focus_testcases = 'H', ---@type string
      focus_result = 'L', ---@type string
    },
  },
}
