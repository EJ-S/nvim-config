return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  version = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install {
      'c',
      'cpp',
      'diff',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'python',
      'toml',
      'vim',
      'vimdoc',
      'json',
      'yaml',
      'xml',
      'glsl',
      'hlsl',
      'rust',
      'cmake',
    }

    local file_type_highlight = function(file_type)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { file_type },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end

    file_type_highlight 'c'
    file_type_highlight 'cpp'
    file_type_highlight 'lua'
    file_type_highlight 'md'
    file_type_highlight 'py'
    file_type_highlight 'toml'
    file_type_highlight 'vim'
    file_type_highlight 'txt'
    file_type_highlight 'json'
    file_type_highlight 'yaml'
    file_type_highlight 'xml'
    file_type_highlight 'glsl'
    file_type_highlight 'hlsl'
    file_type_highlight 'rs'
  end,
}
