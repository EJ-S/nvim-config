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
