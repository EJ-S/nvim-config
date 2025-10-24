return {
  'ziglang/zig.vim',
  config = function()
    vim.g.zig_fmt_parse_errors = 0 -- dont show parse errors in separate window
    vim.g.zig_fmt_autosave = 0 -- dont format-on-save from here (get it in ZLS)

    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = { '*.zig', '*.zon' },
      callback = function()
        vim.lsp.buf.format()
        vim.lsp.buf.code_action {
          context = { only = { 'source.fixAll', 'source.organizeImports' } },
          apply = true,
        }
      end,
    })
  end,
}
