return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    columns = {
      'icon',
      'permissions',
      'size',
      'mtime',
    },
    keymaps = {
      ['q'] = { 'actions.close', mode = 'n' },
    },
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 2,
      max_width = 0.7,
      max_height = 0.7,
      border = 'rounded',
      win_options = {
        winblend = 0,
      },
      get_win_title = nil,
      preview_split = 'auto',
    },
  },
  -- Optional dependencies
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  vim.keymap.set('n', '<leader>e', '<cmd>Oil --float<CR>', { desc = 'Open Parent Directory in Oil' }),
}
