return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '' },
    },
    signs_staged = {
      add = { text = '┆' },
      change = { text = '┆' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '' },
    },
    sign_priority = 0,

    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'green' })
      vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'blue' })
      vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'red' })
      vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'red' })
      vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'orange' })
      vim.api.nvim_set_hl(0, 'GitSignsStagedAdd', { link = 'green' })
      vim.api.nvim_set_hl(0, 'GitSignsStagedChange', { link = 'blue' })
      vim.api.nvim_set_hl(0, 'GitSignsStagedDelete', { link = 'reg' })
      vim.api.nvim_set_hl(0, 'GitSignsStagedTopdelete', { link = 'red' })
      vim.api.nvim_set_hl(0, 'GitSignsStagedChangedelete', { link = 'orange' })

      local function map(mode, l, r, desc, opts)
        opts = opts or {}
        opts.desc = desc
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, 'Next hunk')

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, 'Previous Hunk')

      -- Actions
      map('n', '<leader>hs', gitsigns.stage_hunk, 'Stage Hunk')
      map('n', '<leader>hr', gitsigns.reset_hunk, 'Reset Hunk')

      map('v', '<leader>hs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Stage Hunk')

      map('v', '<leader>hr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Reset Hunk')

      map('n', '<leader>hS', gitsigns.stage_buffer, 'Stage Buffer')
      map('n', '<leader>hR', gitsigns.reset_buffer, 'Reset Buffer')
      map('n', '<leader>hp', gitsigns.preview_hunk, 'Preview Hunk')
      map(
        'n',
        '<leader>hi',
        gitsigns.preview_hunk_inline,
        'Preview Hunk Inline'
      )

      map('n', '<leader>hb', function()
        gitsigns.blame_line { full = true }
      end, 'Blame Line')

      map('n', '<leader>hd', gitsigns.diffthis, 'Diff This')

      map('n', '<leader>hD', function()
        gitsigns.diffthis '~'
      end, 'Diff Last Commit')

      map('n', '<leader>hQ', function()
        gitsigns.setqflist 'all'
      end, 'Quick Fix Hunk All')
      map('n', '<leader>hq', gitsigns.setqflist, 'Quick Fix Hunk')

      -- Toggles
      map(
        'n',
        '<leader>tb',
        gitsigns.toggle_current_line_blame,
        'Toggle Line Blame'
      )
      map('n', '<leader>tw', gitsigns.toggle_word_diff, 'Toggle Word Diff')

      -- Text object
      map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, 'Select Hunk')
    end,
  },

  -- config = function()
  --   --vim.cmd [[highlight GitSignsAdd guifg='#e67e80' guibg=NONE]]
  -- end,
}
