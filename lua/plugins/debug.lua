return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'Error' })
  end,
}
