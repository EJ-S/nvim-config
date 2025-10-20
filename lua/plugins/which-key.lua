return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    delay = 0,
    spec = {
      { '<leader>s', group = '[S]earch' },
      { '<leader>n', group = '[N]eogit' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk' },
      { '<leader>d', group = '[D]ebug' },
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}
