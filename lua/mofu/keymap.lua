vim.keymap.set('n', '<Esc>', '<cmd>noh<CR>')
vim.keymap.set(
  'n',
  '<leader>\\',
  require('mini.files').open,
  { desc = 'Open Mini File Explorer' }
)
vim.keymap.set(
  'n',
  '<C-h>',
  '<C-w><C-h>',
  { desc = 'Move focus to the left window' }
)
vim.keymap.set(
  'n',
  '<C-l>',
  '<C-w><C-l>',
  { desc = 'Move focus to the right window' }
)
vim.keymap.set(
  'n',
  '<C-j>',
  '<C-w><C-j>',
  { desc = 'Move focus to the lower window' }
)
vim.keymap.set(
  'n',
  '<C-k>',
  '<C-w><C-k>',
  { desc = 'Move focus to the upper window' }
)
vim.keymap.set(
  'n',
  '<leader>db',
  '<cmd>DapToggleBreakpoint<cr>',
  { desc = 'Toggle Breakpoint' }
)
vim.keymap.set(
  'n',
  '<F5>',
  '<cmd>DapContinue<cr>',
  { desc = 'Start Debugging' }
)
vim.keymap.set(
  'n',
  '<S-F5>',
  '<cmd>DapTerminate<cr>',
  { desc = 'Stop Debugging' }
)
vim.keymap.set(
  'n',
  '<C-S-F5>',
  require('dap').restart,
  { desc = 'Restart Debugging' }
)
vim.keymap.set(
  'n',
  '<leader>dd',
  require('dapui').open,
  { desc = 'Open Debug UI' }
)
vim.keymap.set(
  'n',
  '<leader>dc',
  require('dapui').close,
  { desc = 'Close Debug  UI' }
)
vim.keymap.set('n', '<F10>', require('dap').step_over, { desc = 'Step Over' })
vim.keymap.set('n', '<F11>', require('dap').step_into, { desc = 'Step Into' })
vim.keymap.set('n', '<S-F11>', require('dap').step_out, { desc = 'Step Out' })
