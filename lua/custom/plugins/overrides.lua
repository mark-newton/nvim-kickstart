-- This config is used to override the default config in kickstart init.lua
-- It overrides the relevant opt sections for each default plugin
return {

  {
    'folke/which-key.nvim',
    opts = {
      delay = 500,
      preset = 'helix',
      win = {
        border = 'rounded', -- none, single, double, shadow
        height = {
          max = math.huge,
        },
      },
      icons = {
        rules = false,
        breadcrumb = ' ', -- symbol used in the command line area that shows your active key combo
        separator = '󱦰  ', -- symbol used between a key and it's label
        group = '󰹍 ', -- symbol prepended to a group
      },
    },
  },

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      preview_config = { border = 'rounded' },
      signs = {
        add = { text = '┃' },
        change = { text = '┃' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = { 'bash', 'lua', 'php', 'html', 'blade', 'css', 'python', 'markdown', 'markdown_inline' },
      auto_install = true,
      ignore_install = { 'haskell' },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      autopairs = { enable = true },
      indent = { enable = false },
      matchup = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<Enter>', -- set to `false` to disable one of the mappings
          node_incremental = '<Enter>',
          scope_incremental = false,
          node_decremental = '<Backspace>',
        },
      },
    },

    -- PHP folds on functions only
    require('vim.treesitter.query').set('php', 'folds', '(method_declaration) @fold'),
    -- require('vim.treesitter.query').set('python', 'folds', '(function_declaration body: (block @fold'),
  },
}
