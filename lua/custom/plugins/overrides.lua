-- This config is used to override the default config in kickstart init.lua
-- It overrides the relevant opt sections for each default plugin

-- function used by blink cmp
local has_words_before = function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  if col == 0 then
    return false
  end
  local line = vim.api.nvim_get_current_line()
  return line:sub(col, col):match '%s' == nil
end

return {

  {
    'folke/which-key.nvim',
    opts = {
      delay = 500,
      win = {
        border = 'rounded', -- none, single, double, shadow
      },
    },
  },

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      preview_config = { border = 'rounded' },
      signs = {
        add = { text = '│' },
        change = { text = '│' },
        delete = { text = '│' },
        topdelete = { text = '│' },
        changedelete = { text = '│' },
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
        disable = { 'python' },
        additional_vim_regex_highlighting = false,
      },
      autopairs = { enable = true },
      indent = { enable = true, disable = { 'ruby', 'php' } },
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

  {
    'saghen/blink.cmp',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = 'make install_jsregexp',
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      'folke/lazydev.nvim',
      'Exafunction/codeium.nvim',
      { 'roobert/tailwindcss-colorizer-cmp.nvim', config = true },
    },
    opts = {
      keymap = {
        preset = 'default',
        ['<Tab>'] = {
          function(cmp)
            if has_words_before() then
              return cmp.insert_next()
            end
          end,
          'fallback',
        },
        ['<S-Tab>'] = {
          function(cmp)
            if has_words_before() then
              return cmp.insert_prev()
            end
          end,
          'fallback',
        },
        ['<CR>'] = { 'accept', 'fallback' },
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
          window = {
            border = 'rounded',
            winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder,Normal:Normal',
          },
        },
        list = { selection = { preselect = false } },
        menu = {
          draw = {
            gap = 2,
            columns = {
              { 'label', 'label_description', gap = 1 },
              { 'kind_icon', 'kind', gap = 1 },
            },
          },
          border = 'rounded',
          winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder,Normal:Normal',
        },
        trigger = { prefetch_on_insert = false },
        ghost_text = { enabled = true },
      },
      cmdline = {
        keymap = {
          preset = 'cmdline',
          ['<CR>'] = { 'accept', 'fallback' },
        },
        completion = {
          list = { selection = { preselect = false } },
          menu = { auto_show = true },
          ghost_text = { enabled = true },
        },
      },
      sources = {
        default = { 'lsp', 'path', 'buffer', 'snippets' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
          codeium = { name = 'Codeium', module = 'codeium.blink', async = true },
        },
        per_filetype = {
          lua = { inherit_defaults = true, 'lazydev' },
          php = { inherit_defaults = true, 'codeium' },
          python = { inherit_defaults = true, 'codeium' },
        },
      },
      signature = {
        enabled = true,
        window = { show_documentation = false },
      },
    },
  },
}
