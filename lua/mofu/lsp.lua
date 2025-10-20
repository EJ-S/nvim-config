vim.lsp.enable 'clangd'
vim.lsp.enable 'lua_ls'

vim.diagnostic.config {
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  },
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(
        mode,
        keys,
        func,
        { buffer = event.buf, desc = 'LSP: ' .. desc }
      )
    end

    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

    map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

    -- Find references for the word under your cursor.
    map(
      'grr',
      require('telescope.builtin').lsp_references,
      '[G]oto [R]eferences'
    )

    map(
      'gri',
      require('telescope.builtin').lsp_implementations,
      '[G]oto [I]mplementation'
    )

    map(
      'grd',
      require('telescope.builtin').lsp_definitions,
      '[G]oto [D]efinition'
    )

    map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    map(
      'gO',
      require('telescope.builtin').lsp_document_symbols,
      'Open Document Symbols'
    )

    map(
      'gW',
      require('telescope.builtin').lsp_dynamic_workspace_symbols,
      'Open Workspace Symbols'
    )

    map(
      'grt',
      require('telescope.builtin').lsp_type_definitions,
      '[G]oto [T]ype Definition'
    )
  end,
})

-- Debugger Config

local dap = require 'dap'
require('dapui').setup()
local dapui = require 'dapui'
dapui.setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = vim.fn.stdpath 'data' .. '\\mason\\bin\\OpenDebugAD7.cmd',
  options = {
    detached = false,
  },
}

dap.configurations.cpp = {
  {
    name = 'Launch file',
    type = 'cppdbg',
    request = 'launch',
    program = function()
      return vim.fn.input(
        'Path to executable: ',
        vim.fn.getcwd() .. '\\',
        'file'
      )
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  --[[{
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = 'C:\\ProgramData\\mingw64\\mingw64\\bin\\gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input(
        'Path to executable: ',
        vim.fn.getcwd() .. '/',
        'file'
      )
    end,
  },--]]
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
