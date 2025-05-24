return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup()

    require('mini.indentscope').setup {
      symbol = '│',
      options = {
        try_as_border = true,
      },
    }

    require('mini.files').setup {
      mappings = {
        go_in = '<right>',
        go_out = '<left>',
        go_in_plus = '<CR>',
        reveal_cwd = '.',
      },
    }

    require('mini.icons').setup {}

    --  Check out: https://github.com/echasnovski/mini.nvim for more
  end,
}
