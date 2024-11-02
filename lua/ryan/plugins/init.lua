-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-lua/plenary.nvim',
    name = 'plenary',
  },
  'ThePrimeagen/vim-be-good',
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
}
