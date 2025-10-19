return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>sf',
      require('telescope.builtin').find_files,
      desc = 'Telescope search files',
    },
    {
      '<leader>sg',
      require('telescope.builtin').live_grep,
      desc = 'Telescope search working directory',
    },
    {
      '<leader>ss',
      require('telescope.builtin').git_files,
      desc = 'Telescope search git files',
    },
    {
      '<leader>sb',
      require('telescope.builtin').current_buffer_fuzzy_find,
      desc = 'Telescope search buffer',
    },
  },
  config = function()
    require('telescope').load_extension 'fzf'
  end,
}
