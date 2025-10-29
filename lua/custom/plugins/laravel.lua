return {
  {
    'adalessa/laravel.nvim',
    dependencies = {
      'tpope/vim-dotenv',
      'nvim-telescope/telescope.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-neotest/nvim-nio',
      'ravitemer/mcphub.nvim', -- optional
    },
    cmd = { 'Laravel' },
    keys = {
      { '<leader>la', ':Laravel artisan<cr>' },
      { '<leader>lr', ':Laravel routes<cr>' },
      { '<leader>lm', ':Laravel related<cr>' },
      {
        'gf',
        function()
          if require('laravel').app('gf').cursor_on_resource() then
            return '<cmd>Laravel gf<CR>'
          else
            return 'gf'
          end
        end,
        noremap = false,
        expr = true,
      },
    },
    event = { 'VeryLazy' },
    opts = {
      lsp_server = 'intelephense',
      features = {
        model_info = {
          enable = true,
        },
        route_info = {
          enable = true,
          view = 'right',
        },
      },
    },
    config = true,
  },
  {
    'ricardoramirezr/blade-nav.nvim',
    dependencies = { -- totally optional
      'saghen/blink.cmp', -- if using blink.cmp
    },
    ft = { 'blade', 'php' }, -- optional, improves startup time
    opts = {
      -- This applies for nvim-cmp and coq, for blink refer to the configuration of this plugin
      close_tag_on_complete = true, -- default: true
    },
  },
  { -- this works across everything but I mainly use it in laravel
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {
      user_default_options = {
        mode = 'virtualtext',
        virtualtext = '󱓻',
        virtualtext_inline = 'before',
        tailwind = true,
      },
    },
  },
}
